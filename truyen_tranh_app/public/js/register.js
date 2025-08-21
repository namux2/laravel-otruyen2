document.addEventListener('DOMContentLoaded', function() {
    const registerForm = document.getElementById('register-form');
    const usernameInput = document.getElementById('username');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirm-password');
    const usernameError = document.getElementById('username-error');
    const emailError = document.getElementById('email-error');
    const passwordError = document.getElementById('password-error');
    const confirmPasswordError = document.getElementById('confirm-password-error');

    registerForm.addEventListener('submit', function(e) {
        e.preventDefault();
        let isValid = true;

        // Username validation
        if (!usernameInput.value) {
            usernameError.classList.remove('hidden');
            usernameInput.classList.add('border-red-500');
            isValid = false;
        } else {
            usernameError.classList.add('hidden');
            usernameInput.classList.remove('border-red-500');
        }

        // Email validation
        if (!emailInput.value || !/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(emailInput.value)) {
            emailError.classList.remove('hidden');
            emailInput.classList.add('border-red-500');
            isValid = false;
        } else {
            emailError.classList.add('hidden');
            emailInput.classList.remove('border-red-500');
        }

        // Password validation
        if (!passwordInput.value || passwordInput.value.length < 8) {
            passwordError.classList.remove('hidden');
            passwordInput.classList.add('border-red-500');
            isValid = false;
        } else {
            passwordError.classList.add('hidden');
            passwordInput.classList.remove('border-red-500');
        }

        // Confirm password validation
        if (passwordInput.value !== confirmPasswordInput.value) {
            confirmPasswordError.classList.remove('hidden');
            confirmPasswordInput.classList.add('border-red-500');
            isValid = false;
        } else {
            confirmPasswordError.classList.add('hidden');
            confirmPasswordInput.classList.remove('border-red-500');
        }

        if (isValid) {
            // Mock API call
            console.log('Registering with:', usernameInput.value, emailInput.value, passwordInput.value);
            // Simulate successful registration and login
            localStorage.setItem('loggedIn', 'true');
            window.location.href = 'profile.html';
        }
    });
});
