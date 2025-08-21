document.addEventListener('DOMContentLoaded', function() {
    const enterSiteButton = document.getElementById('enter-site');
    const cowl = document.getElementById('cowl');
    const backToTopButton = document.getElementById('back-to-top');

    // Cowl logic - show only once per day on homepage
    if (cowl) {
        const today = new Date().toDateString();
        const lastShownDate = localStorage.getItem('cowlLastShown');
        const isHomepage = window.location.pathname.endsWith('index.html') || 
                          window.location.pathname.endsWith('/') || 
                          window.location.pathname === '';
        
        // Only show cowl if:
        // 1. It's the homepage
        // 2. It hasn't been shown today
        if (isHomepage && lastShownDate !== today) {
            cowl.style.display = 'flex';
            // Mark as shown for today
            localStorage.setItem('cowlLastShown', today);
        } else {
            // Hide cowl if not homepage or already shown today
            cowl.style.display = 'none';
        }
    }

    if (enterSiteButton) {
        enterSiteButton.addEventListener('click', function() {
            cowl.style.display = 'none';
        });
    }

    if (backToTopButton) {
        window.addEventListener('scroll', function() {
            if (window.pageYOffset > 300) {
                backToTopButton.classList.add('visible');
            } else {
                backToTopButton.classList.remove('visible');
            }
        });

        backToTopButton.addEventListener('click', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }
});

function search() {
    const searchInput = document.getElementById('search-input');
    const query = searchInput.value;
    if (query) {
        // Implement search functionality here
        console.log('Searching for:', query);
    }
}