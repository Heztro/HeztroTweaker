// Get required functions from React and Lucide
const { useState, useEffect } = React;
const { Download, Settings, Shield, Zap, Check, ChevronRight, Github, MousePointer, ArrowRight, Lock, Cpu, Radio, MonitorCheck, Network, RefreshCcw, Trash2, Power } = Lucide;

function App() {
    const [hoveredCard, setHoveredCard] = useState(null);
    const [isLoading, setIsLoading] = useState(true);
    
    useEffect(() => {
        // Loading animation
        setTimeout(() => setIsLoading(false), 1000);

        // Scroll animations
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

        document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
        return () => observer.disconnect();
    }, []);

    if (isLoading) {
        return <div className="loading"></div>;
    }

    return (
        <div className="relative min-h-screen overflow-hidden">
            {/* Hero Section */}
            <header className="relative container mx-auto px-6 pt-16 pb-32">
                <nav className="flex justify-between items-center mb-16 animate-slide-down">
                    <div className="text-2xl font-bold text-gradient">
                        HeztroTweaker
                    </div>
                    <button onClick={() => window.location.href = 'https://github.com/Heztro/HeztroTweaker'}
                        className="glass px-4 py-2 rounded-lg flex items-center gap-2 hover:bg-white/10 transition-all duration-300">
                        <Github size={20} />
                        View on GitHub
                    </button>
                </nav>
            </header>

            {/* Steps Section */}
            <section className="container mx-auto px-6 py-16">
                <div className="text-center mb-12 reveal">
                    <h2 className="text-3xl font-bold mb-4">How It Works</h2>
                    <p className="text-white/60">Simple steps to optimize your Windows</p>
                </div>
                <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
                    <div className="reveal glass feature-card p-6 text-center" style={{ animationDelay: '0ms' }}>
                        <Download size={24} className="mx-auto mb-4 text-purple-accent feature-icon" />
                        <h3 className="font-bold mb-2">Download</h3>
                        <p className="text-white/60 text-sm">Get HeztroTweaker</p>
                    </div>
                    <div className="reveal glass feature-card p-6 text-center" style={{ animationDelay: '100ms' }}>
                        <MousePointer size={24} className="mx-auto mb-4 text-purple-accent feature-icon" />
                        <h3 className="font-bold mb-2">Run</h3>
                        <p className="text-white/60 text-sm">Launch as admin</p>
                    </div>
                    <div className="reveal glass feature-card p-6 text-center" style={{ animationDelay: '200ms' }}>
                        <Settings size={24} className="mx-auto mb-4 text-purple-accent feature-icon" />
                        <h3 className="font-bold mb-2">Select</h3>
                        <p className="text-white/60 text-sm">Choose Optimization</p>
                    </div>
                    <div className="reveal glass feature-card p-6 text-center" style={{ animationDelay: '300ms' }}>
                        <Zap size={24} className="mx-auto mb-4 text-purple-accent feature-icon" />
                        <h3 className="font-bold mb-2">Done</h3>
                        <p className="text-white/60 text-sm">Enjoy the performance</p>
                    </div>
                </div>
            </section>

            {/* Main Features Section */}
            <section className="container mx-auto px-6 py-16">
                {/* Main Features content goes here */}
            </section>

            {/* Advanced Features Section */}
            <section className="container mx-auto px-6 py-16">
                {/* Advanced Features content goes here */}
            </section>

            {/* CTA Section */}
            <section className="container mx-auto px-6 py-16">
                {/* CTA content goes here */}
            </section>

            {/* Footer */}
            <footer className="container mx-auto px-6 py-8 border-t border-white/10">
                {/* Footer content goes here */}
            </footer>
        </div>
    );
}

// Initialize the app
const root = document.getElementById('root');
ReactDOM.render(<App />, root);
