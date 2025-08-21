// UI Manager for dynamic content loading and management
class UIManager {
    constructor() {
        this.currentPage = 1;
        this.itemsPerPage = 20;
        this.isLoading = false;
        this.init();
    }

    init() {
        this.setupEventListeners();
        this.checkAuthenticationStatus();
        this.loadInitialContent();
    }

    setupEventListeners() {
        // Search functionality
        const searchInput = document.getElementById('search-input');
        if (searchInput) {
            searchInput.addEventListener('input', this.debounce(this.handleSearch.bind(this), 300));
            searchInput.addEventListener('keypress', (e) => {
                if (e.key === 'Enter') {
                    this.handleSearch();
                }
            });
        }

        // Search button
        const searchButton = document.querySelector('.fa-search');
        if (searchButton) {
            searchButton.addEventListener('click', this.handleSearch.bind(this));
        }

        // Hot novels button
        const hotButton = document.querySelector('button:contains("Truyện hot")');
        if (hotButton) {
            hotButton.addEventListener('click', () => this.loadHotNovels());
        }

        // New novels button
        const newButton = document.querySelector('button:contains("Truyện mới")');
        if (newButton) {
            newButton.addEventListener('click', () => this.loadNewNovels());
        }

        // Back to top button
        const backToTopButton = document.getElementById('back-to-top');
        if (backToTopButton) {
            backToTopButton.addEventListener('click', () => {
                window.scrollTo({ top: 0, behavior: 'smooth' });
            });
        }
    }

    // Debounce function for search
    debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }

    // Check authentication status and update UI
    checkAuthenticationStatus() {
        const isAuthenticated = api.isAuthenticated();
        const loginButton = document.getElementById('login-button');
        const registerButton = document.getElementById('register-button');
        const profileLink = document.getElementById('profile-link');

        if (isAuthenticated) {
            if (loginButton) loginButton.style.display = 'none';
            if (registerButton) registerButton.style.display = 'none';
            if (profileLink) profileLink.style.display = 'block';
        } else {
            if (loginButton) loginButton.style.display = 'block';
            if (registerButton) registerButton.style.display = 'block';
            if (profileLink) profileLink.style.display = 'none';
        }
    }

    // Load initial content
    async loadInitialContent() {
        try {
            await Promise.all([
                this.loadFeaturedNovels(),
                this.loadHotNovels(),
                this.loadNewNovels(),
                this.loadLatestChapters(),
                this.loadCategories()
            ]);
        } catch (error) {
            console.error('Error loading initial content:', error);
            this.showError('Không thể tải dữ liệu. Vui lòng thử lại sau.');
        }
    }

    // Load featured novels
    async loadFeaturedNovels() {
        try {
            const novels = await novelAPI.getFeatured(6);
            this.renderNovels(novels.data || novels, 'featured-novels');
        } catch (error) {
            console.error('Error loading featured novels:', error);
        }
    }

    // Load hot novels
    async loadHotNovels() {
        try {
            const novels = await novelAPI.getHot(6);
            this.renderNovels(novels.data || novels, 'hot-novels');
        } catch (error) {
            console.error('Error loading hot novels:', error);
        }
    }

    // Load new novels
    async loadNewNovels() {
        try {
            const novels = await novelAPI.getNew(6);
            this.renderNovels(novels.data || novels, 'new-novels');
        } catch (error) {
            console.error('Error loading new novels:', error);
        }
    }

    // Load latest chapters
    async loadLatestChapters() {
        try {
            const chapters = await chapterAPI.getLatest(10);
            this.renderLatestChapters(chapters.data || chapters);
        } catch (error) {
            console.error('Error loading latest chapters:', error);
        }
    }

    // Load categories
    async loadCategories() {
        try {
            const categories = await categoryAPI.getActive();
            this.renderCategories(categories.data || categories);
        } catch (error) {
            console.error('Error loading categories:', error);
        }
    }

    // Handle search
    async handleSearch() {
        const searchInput = document.getElementById('search-input');
        const query = searchInput.value.trim();

        if (!query) {
            return;
        }

        try {
            this.showLoading();
            const results = await searchAPI.globalSearch(query, { limit: 20 });
            this.showSearchResults(results.data || results, query);
        } catch (error) {
            console.error('Search error:', error);
            this.showError('Không thể thực hiện tìm kiếm. Vui lòng thử lại.');
        } finally {
            this.hideLoading();
        }
    }

    // Show search results
    showSearchResults(results, query) {
        const mainContent = document.querySelector('main') || document.querySelector('.container');
        if (!mainContent) return;

        const searchResultsHTML = `
            <section class="py-12 bg-white">
                <div class="container mx-auto px-4">
                    <div class="mb-8">
                        <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-2">
                            Kết quả tìm kiếm cho "${query}"
                        </h2>
                        <p class="text-gray-600">Tìm thấy ${results.length} kết quả</p>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                        ${this.renderNovelCards(results)}
                    </div>
                </div>
            </section>
        `;

        // Insert search results after header
        const header = document.querySelector('header');
        if (header && header.nextElementSibling) {
            header.nextElementSibling.insertAdjacentHTML('afterend', searchResultsHTML);
        }
    }

    // Render novels in a container
    renderNovels(novels, containerId) {
        const container = document.getElementById(containerId);
        if (!container) return;

        if (!novels || novels.length === 0) {
            container.innerHTML = '<p class="text-gray-500 text-center py-8">Không có truyện nào</p>';
            return;
        }

        const novelsHTML = novels.map(novel => this.createNovelCard(novel)).join('');
        container.innerHTML = novelsHTML;
    }

    // Create novel card HTML
    createNovelCard(novel) {
        const coverImage = novel.cover_image || 'https://via.placeholder.com/300x400';
        const title = novel.title || 'Không có tiêu đề';
        const author = novel.author_name || 'Không rõ tác giả';
        const views = novel.views ? this.formatNumber(novel.views) : '0';
        const chapters = novel.total_chapters || '0';
        const rating = novel.rating || 0;
        const status = novel.status || 'ongoing';

        return `
            <div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300">
                <div class="relative">
                    <img src="${coverImage}" alt="${title}" class="w-full h-48 object-cover">
                    <div class="absolute top-2 right-2">
                        <span class="px-2 py-1 text-xs font-medium rounded-full ${
                            status === 'completed' 
                                ? 'bg-green-500 text-white' 
                                : 'bg-yellow-500 text-white'
                        }">
                            ${status === 'completed' ? 'Hoàn thành' : 'Đang ra'}
                        </span>
                    </div>
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-lg text-gray-800 mb-2 line-clamp-2">
                        <a href="novel-details.html?slug=${novel.slug}" class="hover:text-blue-500">
                            ${title}
                        </a>
                    </h3>
                    <p class="text-gray-600 text-sm mb-2">Tác giả: ${author}</p>
                    <div class="flex items-center justify-between text-sm text-gray-500 mb-3">
                        <span><i class="fas fa-eye mr-1"></i>${views}</span>
                        <span><i class="fas fa-bookmark mr-1"></i>${chapters} chương</span>
                    </div>
                    <div class="flex items-center">
                        <div class="flex text-yellow-400">
                            ${this.generateStarRating(rating)}
                        </div>
                        <span class="ml-2 text-sm text-gray-600">${rating.toFixed(1)}</span>
                    </div>
                </div>
            </div>
        `;
    }

    // Render latest chapters
    renderLatestChapters(chapters) {
        const container = document.querySelector('.latest-chapters') || 
                         document.querySelector('[data-section="latest-chapters"]');
        if (!container || !chapters) return;

        if (chapters.length === 0) {
            container.innerHTML = '<p class="text-gray-500 text-center py-4">Không có chương mới</p>';
            return;
        }

        const chaptersHTML = chapters.map(chapter => `
            <div class="flex items-center space-x-3 py-2 border-b border-gray-100 last:border-b-0">
                <div class="flex-1">
                    <a href="chapter.html?novel=${chapter.novel_slug}&chapter=${chapter.slug}" 
                       class="font-medium text-gray-800 hover:text-blue-500">
                        ${chapter.title}
                    </a>
                    <p class="text-sm text-gray-500">${chapter.novel_title}</p>
                </div>
                <span class="text-xs text-gray-400">${this.formatTimeAgo(chapter.created_at)}</span>
            </div>
        `).join('');

        container.innerHTML = chaptersHTML;
    }

    // Render categories
    renderCategories(categories) {
        const container = document.querySelector('.category-list') || 
                         document.querySelector('[data-section="categories"]');
        if (!container || !categories) return;

        if (categories.length === 0) {
            container.innerHTML = '<p class="text-gray-500 text-center py-4">Không có thể loại nào</p>';
            return;
        }

        const categoriesHTML = categories.map(category => `
            <a href="category.html?slug=${category.slug}" 
               class="inline-block bg-gray-100 hover:bg-blue-500 hover:text-white text-gray-700 px-4 py-2 rounded-full mr-3 mb-3 transition-colors duration-200">
                ${category.name}
            </a>
        `).join('');

        container.innerHTML = categoriesHTML;
    }

    // Generate star rating HTML
    generateStarRating(rating) {
        const fullStars = Math.floor(rating);
        const hasHalfStar = rating % 1 >= 0.5;
        const emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

        let starsHTML = '';
        
        // Full stars
        for (let i = 0; i < fullStars; i++) {
            starsHTML += '<i class="fas fa-star"></i>';
        }
        
        // Half star
        if (hasHalfStar) {
            starsHTML += '<i class="fas fa-star-half-alt"></i>';
        }
        
        // Empty stars
        for (let i = 0; i < emptyStars; i++) {
            starsHTML += '<i class="far fa-star"></i>';
        }

        return starsHTML;
    }

    // Format number with K, M suffixes
    formatNumber(num) {
        if (num >= 1000000) {
            return (num / 1000000).toFixed(1) + 'M';
        } else if (num >= 1000) {
            return (num / 1000).toFixed(1) + 'K';
        }
        return num.toString();
    }

    // Format time ago
    formatTimeAgo(dateString) {
        const date = new Date(dateString);
        const now = new Date();
        const diffInSeconds = Math.floor((now - date) / 1000);

        if (diffInSeconds < 60) return 'Vừa xong';
        if (diffInSeconds < 3600) return Math.floor(diffInSeconds / 60) + ' phút trước';
        if (diffInSeconds < 86400) return Math.floor(diffInSeconds / 3600) + ' giờ trước';
        if (diffInSeconds < 2592000) return Math.floor(diffInSeconds / 86400) + ' ngày trước';
        
        return date.toLocaleDateString('vi-VN');
    }

    // Show loading indicator
    showLoading() {
        this.isLoading = true;
        // Add loading spinner to UI
        const loadingHTML = `
            <div id="loading-spinner" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
                <div class="bg-white p-6 rounded-lg">
                    <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500 mx-auto"></div>
                    <p class="mt-4 text-gray-700">Đang tải...</p>
                </div>
            </div>
        `;
        document.body.insertAdjacentHTML('beforeend', loadingHTML);
    }

    // Hide loading indicator
    hideLoading() {
        this.isLoading = false;
        const spinner = document.getElementById('loading-spinner');
        if (spinner) {
            spinner.remove();
        }
    }

    // Show error message
    showError(message) {
        const errorHTML = `
            <div id="error-message" class="fixed top-4 right-4 bg-red-500 text-white px-6 py-3 rounded-lg shadow-lg z-50">
                <div class="flex items-center">
                    <i class="fas fa-exclamation-circle mr-2"></i>
                    <span>${message}</span>
                    <button onclick="this.parentElement.parentElement.remove()" class="ml-4 text-white hover:text-gray-200">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
        `;
        document.body.insertAdjacentHTML('beforeend', errorHTML);
        
        // Auto remove after 5 seconds
        setTimeout(() => {
            const errorElement = document.getElementById('error-message');
            if (errorElement) {
                errorElement.remove();
            }
        }, 5000);
    }

    // Show success message
    showSuccess(message) {
        const successHTML = `
            <div id="success-message" class="fixed top-4 right-4 bg-green-500 text-white px-6 py-3 rounded-lg shadow-lg z-50">
                <div class="flex items-center">
                    <i class="fas fa-check-circle mr-2"></i>
                    <span>${message}</span>
                    <button onclick="this.parentElement.parentElement.remove()" class="ml-4 text-white hover:text-gray-200">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
        `;
        document.body.insertAdjacentHTML('beforeend', successHTML);
        
        // Auto remove after 5 seconds
        setTimeout(() => {
            const successElement = document.getElementById('success-message');
            if (successElement) {
                successElement.remove();
            }
        }, 5000);
    }
}

// Initialize UI Manager when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    window.uiManager = new UIManager();
});

// Export for use in other files
window.UIManager = UIManager; 