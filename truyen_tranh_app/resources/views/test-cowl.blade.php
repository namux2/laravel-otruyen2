<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Cowl Functionality</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Cowl styles - hidden by default */
        #cowl {
            display: none;
        }
        
        .cowl-overlay {
            background-color: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(10px);
        }
        
        .cowl-animation {
            animation: cowl-fade-in 1s ease-out forwards;
        }
        
        @keyframes cowl-fade-in {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body class="bg-gray-100 font-sans p-8">
    <h1 class="text-3xl font-bold mb-6">Test Cowl Functionality</h1>
    
    <!-- Cowl (Màn hình chào) -->
    <div id="cowl" class="fixed inset-0 z-50 flex items-center justify-center cowl-overlay cowl-animation">
        <div class="text-center p-8 max-w-2xl">
            <div class="flex justify-center mb-6">
                <div class="w-24 h-24 bg-blue-500 rounded-full flex items-center justify-center shadow-lg">
                    <i class="fas fa-book-open text-white text-4xl">📚</i>
                </div>
            </div>
            <h1 class="text-4xl md:text-5xl font-bold text-white mb-4">Chào mừng đến với NovelHub</h1>
            <p class="text-xl text-gray-200 mb-8">Kho truyện online lớn nhất với hàng ngàn tác phẩm đa dạng thể loại</p>
            <button id="enter-site" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-3 px-8 rounded-full text-lg transition duration-300 transform hover:scale-105">
                Bắt đầu khám phá
            </button>
        </div>
    </div>

    <div class="bg-white p-6 rounded-lg shadow-md">
        <h2 class="text-xl font-semibold mb-4">Cowl Logic Test</h2>
        <p class="mb-4">This page demonstrates the cowl (welcome screen) functionality:</p>
        <ul class="list-disc list-inside mb-4 space-y-2">
            <li>The cowl will only show on the homepage (index.html)</li>
            <li>It will only show once per day</li>
            <li>On other pages, it will be hidden</li>
            <li>Click "Bắt đầu khám phá" to hide it</li>
        </ul>
        
        <div class="space-y-4">
            <div>
                <strong>Current URL:</strong> <span id="current-url" class="text-blue-600"></span>
            </div>
            <div>
                <strong>Is Homepage:</strong> <span id="is-homepage" class="text-blue-600"></span>
            </div>
            <div>
                <strong>Last Shown Date:</strong> <span id="last-shown" class="text-blue-600"></span>
            </div>
            <div>
                <strong>Today's Date:</strong> <span id="today-date" class="text-blue-600"></span>
            </div>
            <div>
                <strong>Cowl Display:</strong> <span id="cowl-display" class="text-blue-600"></span>
            </div>
        </div>
        
        <div class="mt-6 space-x-4">
            <button onclick="resetCowl()" class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded">
                Reset Cowl (Clear localStorage)
            </button>
            <button onclick="showCowl()" class="bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded">
                Force Show Cowl
            </button>
            <button onclick="hideCowl()" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded">
                Force Hide Cowl
            </button>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const enterSiteButton = document.getElementById('enter-site');
            const cowl = document.getElementById('cowl');

            // Cowl logic - show only once per day on homepage
            if (cowl) {
                const today = new Date().toDateString();
                const lastShownDate = localStorage.getItem('cowlLastShown');
                const isHomepage = window.location.pathname.endsWith('index.html') || 
                                  window.location.pathname.endsWith('/') || 
                                  window.location.pathname === '';
                
                // Update display info
                document.getElementById('current-url').textContent = window.location.pathname;
                document.getElementById('is-homepage').textContent = isHomepage ? 'Yes' : 'No';
                document.getElementById('last-shown').textContent = lastShownDate || 'Never';
                document.getElementById('today-date').textContent = today;
                
                // Only show cowl if:
                // 1. It's the homepage
                // 2. It hasn't been shown today
                if (isHomepage && lastShownDate !== today) {
                    cowl.style.display = 'flex';
                    document.getElementById('cowl-display').textContent = 'Visible (flex)';
                    // Mark as shown for today
                    localStorage.setItem('cowlLastShown', today);
                } else {
                    // Hide cowl if not homepage or already shown today
                    cowl.style.display = 'none';
                    document.getElementById('cowl-display').textContent = 'Hidden (none)';
                }
            }

            if (enterSiteButton) {
                enterSiteButton.addEventListener('click', function() {
                    cowl.style.display = 'none';
                    document.getElementById('cowl-display').textContent = 'Hidden (none) - Clicked';
                });
            }
        });

        function resetCowl() {
            localStorage.removeItem('cowlLastShown');
            location.reload();
        }

        function showCowl() {
            const cowl = document.getElementById('cowl');
            if (cowl) {
                cowl.style.display = 'flex';
                document.getElementById('cowl-display').textContent = 'Visible (flex) - Forced';
            }
        }

        function hideCowl() {
            const cowl = document.getElementById('cowl');
            if (cowl) {
                cowl.style.display = 'none';
                document.getElementById('cowl-display').textContent = 'Hidden (none) - Forced';
            }
        }
    </script>
</body>
</html> 