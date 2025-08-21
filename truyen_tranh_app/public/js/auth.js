// Authentication handling for login and register pages
class AuthManager {
    constructor() {
        this.init();
    }

    init() {
        this.setupEventListeners();
        this.checkCurrentPage();
    }

    setupEventListeners() {
        // Login form
        const loginForm = document.getElementById('login-form');
        if (loginForm) {
            loginForm.addEventListener('submit', this.handleLogin.bind(this));
        }

        // Register form
        const registerForm = document.getElementById('register-form');
        if (registerForm) {
            registerForm.addEventListener('submit', this.handleRegister.bind(this));
        }

        // Forgot password form
        const forgotPasswordForm = document.getElementById('forgot-password-form');
        if (forgotPasswordForm) {
            forgotPasswordForm.addEventListener('submit', this.handleForgotPassword.bind(this));
        }

        // Reset password form
        const resetPasswordForm = document.getElementById('reset-password-form');
        if (resetPasswordForm) {
            resetPasswordForm.addEventListener('submit', this.handleResetPassword.bind(this));
        }

        // Logout button
        const logoutButton = document.getElementById('logout-button');
        if (logoutButton) {
            logoutButton.addEventListener('click', this.handleLogout.bind(this));
        }

        // Toggle password visibility
        const togglePasswordButtons = document.querySelectorAll('.toggle-password');
        togglePasswordButtons.forEach(button => {
            button.addEventListener('click', this.togglePasswordVisibility.bind(this));
        });

        // Form validation
        this.setupFormValidation();
    }

    checkCurrentPage() {
        const currentPage = window.location.pathname.split('/').pop();
        
        if (currentPage === 'login.html') {
            this.setupLoginPage();
        } else if (currentPage === 'register.html') {
            this.setupRegisterPage();
        } else if (currentPage === 'profile.html') {
            this.setupProfilePage();
        }
    }

    setupLoginPage() {
        // Check if user is already logged in
        if (api.isAuthenticated()) {
            window.location.href = 'index.html';
            return;
        }

        // Add remember me functionality
        const rememberMeCheckbox = document.getElementById('remember-me');
        if (rememberMeCheckbox) {
            const savedEmail = localStorage.getItem('remembered_email');
            if (savedEmail) {
                const emailInput = document.getElementById('email');
                if (emailInput) {
                    emailInput.value = savedEmail;
                    rememberMeCheckbox.checked = true;
                }
            }
        }
    }

    setupRegisterPage() {
        // Check if user is already logged in
        if (api.isAuthenticated()) {
            window.location.href = 'index.html';
            return;
        }

        // Add terms and conditions checkbox validation
        const termsCheckbox = document.getElementById('terms');
        const submitButton = document.querySelector('button[type="submit"]');
        
        if (termsCheckbox && submitButton) {
            termsCheckbox.addEventListener('change', () => {
                submitButton.disabled = !termsCheckbox.checked;
            });
        }
    }

    setupProfilePage() {
        // Check if user is authenticated
        if (!api.isAuthenticated()) {
            window.location.href = 'login.html';
            return;
        }

        this.loadUserProfile();
    }

    async handleLogin(event) {
        event.preventDefault();
        
        const form = event.target;
        const formData = new FormData(form);
        const email = formData.get('email');
        const password = formData.get('password');
        const rememberMe = formData.get('remember-me') === 'on';

        try {
            this.showLoading('Đang đăng nhập...');
            
            const response = await authAPI.login({ email, password });
            
            if (response.success) {
                // Save email if remember me is checked
                if (rememberMe) {
                    localStorage.setItem('remembered_email', email);
                } else {
                    localStorage.removeItem('remembered_email');
                }

                this.showSuccess('Đăng nhập thành công!');
                
                // Redirect to home page or intended page
                const redirectUrl = new URLSearchParams(window.location.search).get('redirect') || 'index.html';
                setTimeout(() => {
                    window.location.href = redirectUrl;
                }, 1000);
            } else {
                this.showError(response.message || 'Đăng nhập thất bại');
            }
        } catch (error) {
            console.error('Login error:', error);
            this.showError('Đăng nhập thất bại. Vui lòng kiểm tra email và mật khẩu.');
        } finally {
            this.hideLoading();
        }
    }

    async handleRegister(event) {
        event.preventDefault();
        
        const form = event.target;
        const formData = new FormData(form);
        
        const userData = {
            username: formData.get('username'),
            email: formData.get('email'),
            password: formData.get('password'),
            confirm_password: formData.get('confirm-password'),
            full_name: formData.get('full-name'),
            terms: formData.get('terms') === 'on'
        };

        // Validate form data
        const validation = this.validateRegistrationData(userData);
        if (!validation.isValid) {
            this.showError(validation.message);
            return;
        }

        try {
            this.showLoading('Đang đăng ký...');
            
            const response = await authAPI.register(userData);
            
            if (response.success) {
                this.showSuccess('Đăng ký thành công! Vui lòng đăng nhập.');
                
                // Clear form
                form.reset();
                
                // Redirect to login page after 2 seconds
                setTimeout(() => {
                    window.location.href = 'login.html';
                }, 2000);
            } else {
                this.showError(response.message || 'Đăng ký thất bại');
            }
        } catch (error) {
            console.error('Registration error:', error);
            this.showError('Đăng ký thất bại. Vui lòng thử lại sau.');
        } finally {
            this.hideLoading();
        }
    }

    async handleForgotPassword(event) {
        event.preventDefault();
        
        const form = event.target;
        const formData = new FormData(form);
        const email = formData.get('email');

        try {
            this.showLoading('Đang gửi email khôi phục...');
            
            const response = await authAPI.forgotPassword(email);
            
            if (response.success) {
                this.showSuccess('Email khôi phục đã được gửi. Vui lòng kiểm tra hộp thư.');
                form.reset();
            } else {
                this.showError(response.message || 'Không thể gửi email khôi phục');
            }
        } catch (error) {
            console.error('Forgot password error:', error);
            this.showError('Không thể gửi email khôi phục. Vui lòng thử lại sau.');
        } finally {
            this.hideLoading();
        }
    }

    async handleResetPassword(event) {
        event.preventDefault();
        
        const form = event.target;
        const formData = new FormData(form);
        const token = formData.get('token');
        const newPassword = formData.get('new-password');
        const confirmPassword = formData.get('confirm-password');

        if (newPassword !== confirmPassword) {
            this.showError('Mật khẩu xác nhận không khớp');
            return;
        }

        try {
            this.showLoading('Đang đặt lại mật khẩu...');
            
            const response = await authAPI.resetPassword(token, newPassword);
            
            if (response.success) {
                this.showSuccess('Mật khẩu đã được đặt lại thành công!');
                
                // Redirect to login page after 2 seconds
                setTimeout(() => {
                    window.location.href = 'login.html';
                }, 2000);
            } else {
                this.showError(response.message || 'Không thể đặt lại mật khẩu');
            }
        } catch (error) {
            console.error('Reset password error:', error);
            this.showError('Không thể đặt lại mật khẩu. Vui lòng thử lại sau.');
        } finally {
            this.hideLoading();
        }
    }

    async handleLogout() {
        try {
            await authAPI.logout();
            this.showSuccess('Đăng xuất thành công!');
            
            // Redirect to home page after 1 second
            setTimeout(() => {
                window.location.href = 'index.html';
            }, 1000);
        } catch (error) {
            console.error('Logout error:', error);
            // Still redirect even if logout fails
            window.location.href = 'index.html';
        }
    }

    validateRegistrationData(data) {
        if (!data.username || data.username.length < 3) {
            return { isValid: false, message: 'Tên đăng nhập phải có ít nhất 3 ký tự' };
        }

        if (!data.email || !this.isValidEmail(data.email)) {
            return { isValid: false, message: 'Email không hợp lệ' };
        }

        if (!data.password || data.password.length < 6) {
            return { isValid: false, message: 'Mật khẩu phải có ít nhất 6 ký tự' };
        }

        if (data.password !== data.confirm_password) {
            return { isValid: false, message: 'Mật khẩu xác nhận không khớp' };
        }

        if (!data.full_name || data.full_name.trim().length === 0) {
            return { isValid: false, message: 'Vui lòng nhập họ tên đầy đủ' };
        }

        if (!data.terms) {
            return { isValid: false, message: 'Vui lòng đồng ý với điều khoản sử dụng' };
        }

        return { isValid: true };
    }

    isValidEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    setupFormValidation() {
        // Real-time password strength validation
        const passwordInputs = document.querySelectorAll('input[type="password"]');
        passwordInputs.forEach(input => {
            input.addEventListener('input', this.validatePasswordStrength.bind(this));
        });

        // Real-time email validation
        const emailInputs = document.querySelectorAll('input[type="email"]');
        emailInputs.forEach(input => {
            input.addEventListener('blur', this.validateEmail.bind(this));
        });
    }

    validatePasswordStrength(event) {
        const password = event.target.value;
        const strengthIndicator = event.target.parentNode.querySelector('.password-strength');
        
        if (!strengthIndicator) return;

        let strength = 0;
        let message = '';

        if (password.length >= 8) strength++;
        if (/[a-z]/.test(password)) strength++;
        if (/[A-Z]/.test(password)) strength++;
        if (/[0-9]/.test(password)) strength++;
        if (/[^A-Za-z0-9]/.test(password)) strength++;

        switch (strength) {
            case 0:
            case 1:
                message = 'Rất yếu';
                strengthIndicator.className = 'password-strength text-red-500 text-xs mt-1';
                break;
            case 2:
                message = 'Yếu';
                strengthIndicator.className = 'password-strength text-orange-500 text-xs mt-1';
                break;
            case 3:
                message = 'Trung bình';
                strengthIndicator.className = 'password-strength text-yellow-500 text-xs mt-1';
                break;
            case 4:
                message = 'Mạnh';
                strengthIndicator.className = 'password-strength text-blue-500 text-xs mt-1';
                break;
            case 5:
                message = 'Rất mạnh';
                strengthIndicator.className = 'password-strength text-green-500 text-xs mt-1';
                break;
        }

        strengthIndicator.textContent = message;
    }

    validateEmail(event) {
        const email = event.target.value;
        const emailError = event.target.parentNode.querySelector('.email-error');
        
        if (!emailError) return;

        if (!this.isValidEmail(email)) {
            emailError.textContent = 'Email không hợp lệ';
            emailError.className = 'email-error text-red-500 text-xs mt-1';
        } else {
            emailError.textContent = '';
            emailError.className = 'email-error text-xs mt-1';
        }
    }

    togglePasswordVisibility(event) {
        const button = event.target;
        const input = button.parentNode.querySelector('input[type="password"]');
        const icon = button.querySelector('i');

        if (input.type === 'password') {
            input.type = 'text';
            icon.className = 'fas fa-eye-slash';
        } else {
            input.type = 'password';
            icon.className = 'fas fa-eye';
        }
    }

    async loadUserProfile() {
        try {
            const user = await api.getCurrentUser();
            this.displayUserProfile(user);
        } catch (error) {
            console.error('Error loading user profile:', error);
            this.showError('Không thể tải thông tin người dùng');
        }
    }

    displayUserProfile(user) {
        // Update profile information in the UI
        const profileElements = {
            'username': user.username,
            'email': user.email,
            'full-name': user.full_name,
            'join-date': new Date(user.created_at).toLocaleDateString('vi-VN'),
            'avatar': user.avatar || 'https://via.placeholder.com/100'
        };

        Object.keys(profileElements).forEach(key => {
            const element = document.getElementById(key);
            if (element) {
                if (key === 'avatar') {
                    element.src = profileElements[key];
                } else {
                    element.textContent = profileElements[key];
                }
            }
        });
    }

    showLoading(message = 'Đang xử lý...') {
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
        
        // Auto remove after 5 seconds
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
        
        // Auto remove after 5 seconds
        setTimeout(() => {
            const errorElement = document.getElementById('error-message');
            if (errorElement) {
                errorElement.remove();
            }
        }, 5000);
    }
}

// Initialize Auth Manager when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    window.authManager = new AuthManager();
});

// Export for use in other files
window.AuthManager = AuthManager; 