// Notification system for success and error messages
class NotificationManager {
    constructor() {
        this.init();
    }

    init() {
        this.setupAutoHide();
        this.setupCloseButtons();
    }

    setupAutoHide() {
        // Auto-hide success messages after 5 seconds
        const successMessages = document.querySelectorAll('.bg-green-100');
        successMessages.forEach(message => {
            setTimeout(() => {
                this.fadeOut(message);
            }, 5000);
        });

        // Auto-hide error messages after 8 seconds
        const errorMessages = document.querySelectorAll('.bg-red-100');
        errorMessages.forEach(message => {
            setTimeout(() => {
                this.fadeOut(message);
            }, 8000);
        });
    }

    setupCloseButtons() {
        // Add close button to all alert messages
        const alerts = document.querySelectorAll('.bg-green-100, .bg-red-100, .bg-blue-100, .bg-yellow-100');
        alerts.forEach(alert => {
            if (!alert.querySelector('.close-btn')) {
                const closeBtn = document.createElement('button');
                closeBtn.className = 'close-btn absolute top-2 right-2 text-gray-500 hover:text-gray-700';
                closeBtn.innerHTML = '<i class="fas fa-times"></i>';
                closeBtn.onclick = () => this.fadeOut(alert);
                
                alert.style.position = 'relative';
                alert.appendChild(closeBtn);
            }
        });
    }

    fadeOut(element) {
        element.style.transition = 'opacity 0.5s ease-out';
        element.style.opacity = '0';
        setTimeout(() => {
            if (element.parentNode) {
                element.parentNode.removeChild(element);
            }
        }, 500);
    }

    showSuccess(message, duration = 5000) {
        this.showNotification(message, 'success', duration);
    }

    showError(message, duration = 8000) {
        this.showNotification(message, 'error', duration);
    }

    showWarning(message, duration = 6000) {
        this.showNotification(message, 'warning', duration);
    }

    showInfo(message, duration = 4000) {
        this.showNotification(message, 'info', duration);
    }

    showNotification(message, type = 'info', duration = 5000) {
        const alertClass = {
            'success': 'bg-green-100 border-green-400 text-green-700',
            'error': 'bg-red-100 border-red-400 text-red-700',
            'warning': 'bg-yellow-100 border-yellow-400 text-yellow-700',
            'info': 'bg-blue-100 border-blue-400 text-blue-700'
        };

        const iconClass = {
            'success': 'fas fa-check-circle',
            'error': 'fas fa-exclamation-circle',
            'warning': 'fas fa-exclamation-triangle',
            'info': 'fas fa-info-circle'
        };

        const notification = document.createElement('div');
        notification.className = `border px-4 py-3 rounded mb-4 max-w-4xl mx-auto ${alertClass[type]} relative`;
        notification.innerHTML = `
            <div class="flex items-center">
                <i class="${iconClass[type]} mr-2"></i>
                ${message}
            </div>
            <button class="close-btn absolute top-2 right-2 text-gray-500 hover:text-gray-700">
                <i class="fas fa-times"></i>
            </button>
        `;

        // Insert at the top of main content
        const main = document.querySelector('main');
        if (main) {
            main.insertBefore(notification, main.firstChild);
        }

        // Auto-hide after duration
        if (duration > 0) {
            setTimeout(() => {
                this.fadeOut(notification);
            }, duration);
        }

        // Setup close button
        const closeBtn = notification.querySelector('.close-btn');
        closeBtn.onclick = () => this.fadeOut(notification);
    }
}

// Initialize notification manager when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    window.notificationManager = new NotificationManager();
});

// Export for use in other scripts
if (typeof module !== 'undefined' && module.exports) {
    module.exports = NotificationManager;
}
