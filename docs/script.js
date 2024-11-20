// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Initialize Lucide icons
    lucide.createIcons();

    // Handle loading screen
    const loadingScreen = document.getElementById('loadingScreen');
    setTimeout(() => {
        loadingScreen.style.opacity = '0';
        setTimeout(() => {
            loadingScreen.style.display = 'none';
        }, 600);
    }, 1000);

    // Initialize scroll animations
    const observer = new IntersectionObserver(
        (entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-in');
                    observer.unobserve(entry.target);
                }
            });
        },
        { threshold: 0.1 }
    );

    // Observe all elements with 'reveal' class
    document.querySelectorAll('.reveal').forEach(el => observer.observe(el));

    // Feature card hover effects
    document.querySelectorAll('.feature-card').forEach(card => {
        card.addEventListener('mouseenter', () => {
            const icon = card.querySelector('.feature-icon');
            if (icon) {
                icon.style.transform = 'scale(1.1)';
                icon.style.color = '#8b5cf6'; // Purple accent color
            }
        });

        card.addEventListener('mouseleave', () => {
            const icon = card.querySelector('.feature-icon');
            if (icon) {
                icon.style.transform = 'scale(1)';
                icon.style.color = '';
            }
        });
    });

    // Smooth scroll for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // Add animation classes to elements on load
    const animateElements = document.querySelectorAll('.animate-fade-in, .animate-slide-up, .animate-slide-down');
    animateElements.forEach(element => {
        element.style.opacity = '0';
        setTimeout(() => {
            element.style.opacity = '1';
        }, 100);
    });

    // Handle glass card hover effects
    document.querySelectorAll('.glass').forEach(element => {
        element.addEventListener('mousemove', (e) => {
            const rect = element.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;

            element.style.background = `
                radial-gradient(
                    circle at ${x}px ${y}px,
                    rgba(255, 255, 255, 0.06),
                    rgba(255, 255, 255, 0.03) 40%
                )
            `;
        });

        element.addEventListener('mouseleave', () => {
            element.style.background = 'rgba(255, 255, 255, 0.03)';
        });
    });

    // Button hover effects
    document.querySelectorAll('.btn-primary').forEach(button => {
        button.addEventListener('mouseenter', () => {
            button.style.transform = 'translateY(-2px)';
        });

        button.addEventListener('mouseleave', () => {
            button.style.transform = 'translateY(0)';
        });
    });

    // Initialize floating orb animations
    const orbs = document.querySelectorAll('.glow-orb');
    orbs.forEach((orb, index) => {
        orb.style.animation = `float ${10 + index * 2}s infinite`;
        orb.style.animationDelay = `${index * -2}s`;
    });
});

// Handle scroll progress
window.addEventListener('scroll', () => {
    const scrollProgress = window.scrollY / (document.documentElement.scrollHeight - window.innerHeight);
    const header = document.querySelector('nav');
    
    if (scrollProgress > 0.1) {
        header.classList.add('glass');
        header.style.backdropFilter = 'blur(10px)';
    } else {
        header.classList.remove('glass');
        header.style.backdropFilter = 'none';
    }
});

// Handle resize events for responsive behavior
let resizeTimeout;
window.addEventListener('resize', () => {
    clearTimeout(resizeTimeout);
    resizeTimeout = setTimeout(() => {
        lucide.createIcons(); // Refresh icons on resize
        
        // Update any responsive elements
        const cards = document.querySelectorAll('.feature-card');
        cards.forEach(card => {
            if (window.innerWidth < 768) {
                card.classList.remove('reveal');
            } else {
                card.classList.add('reveal');
            }
        });
    }, 250);
});
