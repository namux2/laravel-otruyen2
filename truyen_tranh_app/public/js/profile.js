// Profile Management JavaScript
class ProfileManager {
    constructor() {
        this.init();
    }

    init() {
        this.setupAvatarUpload();
        this.setupFormValidation();
        this.setupFollowToggle();
        this.setupHistoryManagement();
        this.setupPasswordChange();
    }

    setupAvatarUpload() {
        const avatarInput = document.querySelector('input[name="avatar"]');
        const avatarPreview = document.querySelector('.avatar-preview img');
        
        if (avatarInput && avatarPreview) {
            avatarInput.addEventListener('change', function(e) {
                const file = e.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        avatarPreview.src = e.target.result;
                    };
                    reader.readAsDataURL(file);
                }
            });
        }
    }

    setupFormValidation() {
        const forms = document.querySelectorAll('form');
        forms.forEach(form => {
            form.addEventListener('submit', function(e) {
                if (!this.checkValidity()) {
                    e.preventDefault();
                    e.stopPropagation();
                }
                this.classList.add('was-validated');
            });
        });
    }

    setupFollowToggle() {
        document.addEventListener('click', (e) => {
            if (e.target.classList.contains('toggle-follow')) {
                e.preventDefault();
                this.toggleFollow(e.target);
            }
        });
    }

    async toggleFollow(button) {
        const novelId = button.dataset.novelId;
        const action = button.dataset.action;
        
        try {
            const response = await fetch('/profile/toggle-follow', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({
                    novel_id: novelId,
                    action: action
                })
            });

            const data = await response.json();
            
            if (data.success) {
                // Cập nhật UI
                if (action === 'follow') {
                    button.textContent = 'Bỏ theo dõi';
                    button.dataset.action = 'unfollow';
                    button.classList.remove('btn-primary');
                    button.classList.add('btn-danger');
                } else {
                    button.textContent = 'Theo dõi';
                    button.dataset.action = 'follow';
                    button.classList.remove('btn-danger');
                    button.classList.add('btn-primary');
                }
                
                this.showNotification(data.message, 'success');
            }
        } catch (error) {
            console.error('Error:', error);
            this.showNotification('Có lỗi xảy ra!', 'error');
        }
    }

    setupHistoryManagement() {
        document.addEventListener('click', (e) => {
            if (e.target.classList.contains('remove-history')) {
                e.preventDefault();
                this.removeFromHistory(e.target);
            }
        });
    }

    async removeFromHistory(button) {
        const historyId = button.dataset.historyId;
        
        try {
            const response = await fetch('/profile/remove-history', {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({
                    history_id: historyId
                })
            });

            const data = await response.json();
            
            if (data.success) {
                // Xóa element khỏi DOM
                const historyItem = button.closest('.history-item');
                if (historyItem) {
                    historyItem.remove();
                }
                
                this.showNotification(data.message, 'success');
            }
        } catch (error) {
            console.error('Error:', error);
            this.showNotification('Có lỗi xảy ra!', 'error');
        }
    }

    setupPasswordChange() {
        const passwordForm = document.querySelector('form[action*="password"]');
        if (passwordForm) {
            passwordForm.addEventListener('submit', (e) => {
                const newPassword = document.querySelector('input[name="new_password"]');
                const confirmPassword = document.querySelector('input[name="new_password_confirmation"]');
                
                if (newPassword.value !== confirmPassword.value) {
                    e.preventDefault();
                    this.showNotification('Mật khẩu xác nhận không khớp!', 'error');
                    return;
                }
                
                if (newPassword.value.length < 6) {
                    e.preventDefault();
                    this.showNotification('Mật khẩu phải có ít nhất 6 ký tự!', 'error');
                    return;
                }
            });
        }
    }

    showNotification(message, type = 'info') {
        // Tạo notification element
        const notification = document.createElement('div');
        notification.className = `alert alert-${type} alert-dismissible fade show position-fixed`;
        notification.style.cssText = 'top: 20px; right: 20px; z-index: 9999; min-width: 300px;';
        notification.innerHTML = `
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        `;

        // Thêm vào body
        document.body.appendChild(notification);

        // Tự động ẩn sau 5 giây
        setTimeout(() => {
            if (notification.parentNode) {
                notification.remove();
            }
        }, 5000);
    }

    // Load dữ liệu truyện đang theo dõi
    async loadFollowedNovels() {
        try {
            const response = await fetch('/profile/followed-novels');
            const novels = await response.json();
            this.renderFollowedNovels(novels);
        } catch (error) {
            console.error('Error loading followed novels:', error);
        }
    }

    // Load lịch sử đọc
    async loadReadingHistory() {
        try {
            const response = await fetch('/profile/reading-history');
            const history = await response.json();
            this.renderReadingHistory(history);
        } catch (error) {
            console.error('Error loading reading history:', error);
        }
    }

    renderFollowedNovels(novels) {
        const container = document.querySelector('.followed-novels-container');
        if (!container) return;

        container.innerHTML = novels.map(novel => `
            <div class="flex items-center space-x-3 p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition duration-200">
                <img src="${novel.cover}" alt="${novel.title}" class="w-12 h-16 object-cover rounded">
                <div class="flex-1">
                    <h4 class="font-medium text-gray-800">${novel.title}</h4>
                    <p class="text-sm text-gray-600">${novel.latest_chapter}</p>
                    <div class="flex items-center space-x-2 mt-1">
                        <span class="text-xs bg-blue-100 text-blue-800 px-2 py-1 rounded">Đang theo dõi</span>
                        <button class="text-xs text-red-600 hover:text-red-800 toggle-follow" 
                                data-novel-id="${novel.id}" 
                                data-action="unfollow">Bỏ theo dõi</button>
                    </div>
                </div>
            </div>
        `).join('');
    }

    renderReadingHistory(history) {
        const container = document.querySelector('.reading-history-container');
        if (!container) return;

        container.innerHTML = history.map(item => `
            <div class="flex items-center justify-between p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition duration-200 history-item">
                <div class="flex items-center space-x-3">
                    <img src="${item.cover}" alt="${item.novel_title}" class="w-10 h-13 object-cover rounded">
                    <div>
                        <h4 class="font-medium text-gray-800">${item.novel_title}</h4>
                        <p class="text-sm text-gray-600">${item.chapter} - ${item.read_time}</p>
                    </div>
                </div>
                <div class="flex items-center space-x-2">
                    <button class="text-blue-600 hover:text-blue-800 text-sm">Tiếp tục đọc</button>
                    <button class="text-gray-400 hover:text-gray-600 remove-history" 
                            data-history-id="${item.id}">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
        `).join('');
    }
}

// Khởi tạo ProfileManager khi DOM đã sẵn sàng
document.addEventListener('DOMContentLoaded', function() {
    new ProfileManager();
}); 