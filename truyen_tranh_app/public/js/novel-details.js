// Novel Details Page Handler
class NovelDetailsManager {
    constructor() {
        this.novelId = null;
        this.novelSlug = null;
        this.currentChapter = null;
        this.chapters = [];
        this.currentPage = 1;
        this.itemsPerPage = 20;
        this.init();
    }

    init() {
        this.extractNovelInfo();
        this.setupEventListeners();
        this.loadNovelDetails();
        this.loadChapters();
    }

    extractNovelInfo() {
        const urlParams = new URLSearchParams(window.location.search);
        this.novelId = urlParams.get('id');
        this.novelSlug = urlParams.get('slug');
        
        if (!this.novelId && !this.novelSlug) {
            this.showError('Không tìm thấy thông tin truyện');
            return;
        }
    }

    setupEventListeners() {
        // Chapter navigation
        const prevChapterBtn = document.getElementById('prev-chapter');
        const nextChapterBtn = document.getElementById('next-chapter');
        
        if (prevChapterBtn) {
            prevChapterBtn.addEventListener('click', () => this.navigateChapter('prev'));
        }
        
        if (nextChapterBtn) {
            nextChapterBtn.addEventListener('click', () => this.navigateChapter('next'));
        }

        // Bookmark button
        const bookmarkBtn = document.getElementById('bookmark-btn');
        if (bookmarkBtn) {
            bookmarkBtn.addEventListener('click', () => this.toggleBookmark());
        }

        // Rating
        const ratingStars = document.querySelectorAll('.rating-star');
        ratingStars.forEach((star, index) => {
            star.addEventListener('click', () => this.rateNovel(index + 1));
            star.addEventListener('mouseenter', () => this.hoverRating(index + 1));
            star.addEventListener('mouseleave', () => this.resetRating());
        });

        // Chapter list pagination
        const loadMoreBtn = document.getElementById('load-more-chapters');
        if (loadMoreBtn) {
            loadMoreBtn.addEventListener('click', () => this.loadMoreChapters());
        }
    }

    async loadNovelDetails() {
        try {
            this.showLoading('Đang tải thông tin truyện...');
            
            let novel;
            if (this.novelId) {
                novel = await novelAPI.getById(this.novelId);
            } else {
                novel = await novelAPI.getBySlug(this.novelSlug);
            }

            if (novel.success) {
                this.displayNovelDetails(novel.data || novel);
                this.updatePageTitle(novel.data || novel);
            } else {
                this.showError('Không thể tải thông tin truyện');
            }
        } catch (error) {
            console.error('Error loading novel details:', error);
            this.showError('Không thể tải thông tin truyện');
        } finally {
            this.hideLoading();
        }
    }

    async loadChapters() {
        try {
            const novelIdentifier = this.novelId || this.novelSlug;
            const chapters = await chapterAPI.getAll(novelIdentifier, {
                page: this.currentPage,
                limit: this.itemsPerPage
            });

            if (chapters.success) {
                this.chapters = chapters.data || chapters;
                this.displayChapters();
                this.updateChapterPagination();
            } else {
                this.showError('Không thể tải danh sách chương');
            }
        } catch (error) {
            console.error('Error loading chapters:', error);
            this.showError('Không thể tải danh sách chương');
        }
    }

    displayNovelDetails(novel) {
        // Update novel cover
        const coverImg = document.getElementById('novel-cover');
        if (coverImg) {
            coverImg.src = novel.cover_image || 'https://via.placeholder.com/300x400';
            coverImg.alt = novel.title;
        }

        // Update novel title
        const titleElement = document.getElementById('novel-title');
        if (titleElement) {
            titleElement.textContent = novel.title;
        }

        // Update author
        const authorElement = document.getElementById('novel-author');
        if (authorElement) {
            authorElement.textContent = novel.author_name || 'Không rõ tác giả';
        }

        // Update description
        const descriptionElement = document.getElementById('novel-description');
        if (descriptionElement) {
            descriptionElement.textContent = novel.description || 'Không có mô tả';
        }

        // Update status
        const statusElement = document.getElementById('novel-status');
        if (statusElement) {
            const statusText = novel.status === 'completed' ? 'Hoàn thành' : 'Đang ra';
            const statusClass = novel.status === 'completed' ? 'bg-green-500' : 'bg-yellow-500';
            statusElement.textContent = statusText;
            statusElement.className = `px-3 py-1 rounded-full text-white text-sm font-medium ${statusClass}`;
        }

        // Update statistics
        const viewsElement = document.getElementById('novel-views');
        if (viewsElement) {
            viewsElement.textContent = this.formatNumber(novel.views || 0);
        }

        const chaptersElement = document.getElementById('novel-chapters');
        if (chaptersElement) {
            chaptersElement.textContent = novel.total_chapters || 0;
        }

        const ratingElement = document.getElementById('novel-rating');
        if (ratingElement) {
            ratingElement.textContent = (novel.rating || 0).toFixed(1);
        }

        // Update categories
        const categoriesElement = document.getElementById('novel-categories');
        if (categoriesElement && novel.categories) {
            const categoriesHTML = novel.categories.map(category => 
                `<span class="inline-block bg-gray-100 text-gray-700 px-3 py-1 rounded-full text-sm mr-2 mb-2">${category.name}</span>`
            ).join('');
            categoriesElement.innerHTML = categoriesHTML;
        }
    }

    displayChapters() {
        const chaptersContainer = document.getElementById('chapters-list');
        if (!chaptersContainer) return;

        if (!this.chapters || this.chapters.length === 0) {
            chaptersContainer.innerHTML = '<p class="text-gray-500 text-center py-8">Không có chương nào</p>';
            return;
        }

        const chaptersHTML = this.chapters.map((chapter, index) => `
            <div class="flex items-center justify-between py-3 border-b border-gray-100 last:border-b-0">
                <div class="flex items-center space-x-3">
                    <span class="text-gray-500 text-sm w-8">${chapter.chapter_number}</span>
                    <a href="chapter.html?novel=${this.novelId || this.novelSlug}&chapter=${chapter.slug}" 
                       class="text-gray-800 hover:text-blue-500 font-medium">
                        ${chapter.title}
                    </a>
                </div>
                <div class="flex items-center space-x-4 text-sm text-gray-500">
                    <span><i class="fas fa-eye mr-1"></i>${this.formatNumber(chapter.views || 0)}</span>
                    <span><i class="fas fa-clock mr-1"></i>${this.formatTimeAgo(chapter.created_at)}</span>
                </div>
            </div>
        `).join('');

        chaptersContainer.innerHTML = chaptersHTML;
    }

    updateChapterPagination() {
        const loadMoreBtn = document.getElementById('load-more-chapters');
        if (!loadMoreBtn) return;

        if (this.chapters.length < this.itemsPerPage) {
            loadMoreBtn.style.display = 'none';
        } else {
            loadMoreBtn.style.display = 'block';
        }
    }

    async loadMoreChapters() {
        this.currentPage++;
        try {
            const novelIdentifier = this.novelId || this.novelSlug;
            const moreChapters = await chapterAPI.getAll(novelIdentifier, {
                page: this.currentPage,
                limit: this.itemsPerPage
            });

            if (moreChapters.success) {
                const newChapters = moreChapters.data || moreChapters;
                this.chapters = [...this.chapters, ...newChapters];
                this.displayChapters();
                this.updateChapterPagination();
            }
        } catch (error) {
            console.error('Error loading more chapters:', error);
            this.currentPage--;
        }
    }

    async toggleBookmark() {
        if (!api.isAuthenticated()) {
            window.location.href = 'login.html?redirect=' + encodeURIComponent(window.location.href);
            return;
        }

        try {
            const bookmarkBtn = document.getElementById('bookmark-btn');
            const isBookmarked = bookmarkBtn.classList.contains('text-red-500');

            if (isBookmarked) {
                await this.removeBookmark();
                bookmarkBtn.classList.remove('text-red-500');
                bookmarkBtn.classList.add('text-gray-400');
                bookmarkBtn.querySelector('i').className = 'far fa-heart';
            } else {
                await this.addBookmark();
                bookmarkBtn.classList.remove('text-gray-400');
                bookmarkBtn.classList.add('text-red-500');
                bookmarkBtn.querySelector('i').className = 'fas fa-heart';
            }
        } catch (error) {
            console.error('Error toggling bookmark:', error);
            this.showError('Không thể cập nhật bookmark');
        }
    }

    async addBookmark() {
        console.log('Adding bookmark for novel:', this.novelId || this.novelSlug);
    }

    async removeBookmark() {
        console.log('Removing bookmark for novel:', this.novelId || this.novelSlug);
    }

    async rateNovel(rating) {
        if (!api.isAuthenticated()) {
            window.location.href = 'login.html?redirect=' + encodeURIComponent(window.location.href);
            return;
        }

        try {
            console.log('Rating novel with:', rating);
            this.updateRatingDisplay(rating);
            this.showSuccess('Đánh giá của bạn đã được ghi nhận!');
        } catch (error) {
            console.error('Error rating novel:', error);
            this.showError('Không thể gửi đánh giá');
        }
    }

    hoverRating(rating) {
        this.updateRatingDisplay(rating, true);
    }

    resetRating() {
        const currentRating = 0;
        this.updateRatingDisplay(currentRating);
    }

    updateRatingDisplay(rating, isHover = false) {
        const ratingStars = document.querySelectorAll('.rating-star');
        ratingStars.forEach((star, index) => {
            if (index < rating) {
                star.className = `rating-star text-yellow-400 ${isHover ? 'hover:scale-110' : ''}`;
                star.querySelector('i').className = 'fas fa-star';
            } else {
                star.className = `rating-star text-gray-300 ${isHover ? 'hover:scale-110' : ''}`;
                star.querySelector('i').className = 'far fa-star';
            }
        });
    }

    updatePageTitle(novel) {
        document.title = `${novel.title} - NovelHub`;
    }

    formatNumber(num) {
        if (num >= 1000000) {
            return (num / 1000000).toFixed(1) + 'M';
        } else if (num >= 1000) {
            return (num / 1000).toFixed(1) + 'K';
        }
        return num.toString();
    }

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

    showLoading(message = 'Đang tải...') {
        const loadingHTML = `
            <div id="loading-overlay" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
                <div class="bg-white p-6 rounded-lg">
                    <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500 mx-auto"></div>
                    <p class="mt-4 text-gray-700">${message}</p>
                </div>
            </div>
        `;
        document.body.insertAdjacentHTML('beforeend', loadingHTML);
    }

    hideLoading() {
        const loadingOverlay = document.getElementById('loading-overlay');
        if (loadingOverlay) {
            loadingOverlay.remove();
        }
    }

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
        
        setTimeout(() => {
            const successElement = document.getElementById('success-message');
            if (successElement) {
                successElement.remove();
            }
        }, 5000);
    }

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
        
        setTimeout(() => {
            const errorElement = document.getElementById('error-message');
            if (errorElement) {
                errorElement.remove();
            }
        }, 5000);
    }
}

// Initialize Novel Details Manager when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    window.novelDetailsManager = new NovelDetailsManager();
});

// Export for use in other files
window.NovelDetailsManager = NovelDetailsManager; 