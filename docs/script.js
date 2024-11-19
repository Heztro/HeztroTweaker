// Get required functions from React and Lucide
const { useState, useEffect } = React;
const { Download, Settings, Shield, Zap, Check, ChevronRight, Github, MousePointer, ArrowRight, Lock, Cpu, Radio, MonitorCheck, Network, RefreshCcw, Trash2, Power } = lucide;

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

    const mainFeatures = [
        {
            icon: Zap,
            title: 'Quick Optimization Presets',
            description: 'Choose your performance level',
            items: [
                'Minimal - Safe optimizations',
                'Recommended - Balanced performance',
                'Extreme - Maximum performance',
            ]
        },
        {
            icon: Settings,
            title: 'Windows & Registry',
            description: 'Core system optimizations',
            items: [
                'Ultimate Performance Mode',
                'Registry Optimization',
                'DirectX & Game Mode',
                'Input Lag Reduction'
            ]
        },
        {
            icon: Lock,
            title: 'Privacy & Security',
            description: 'Enhanced system protection',
            items: [
                'Telemetry Control',
                'Privacy Enhancement',
                'Network Security',
                'Tracker Prevention'
            ]
        }
    ];

    const advancedFeatures = [
        {
            icon: Trash2,
            title: 'System Cleanup',
            description: 'Remove bloatware & optimize storage',
            items: [
                'Remove Microsoft Apps',
                'Clear Temporary Files',
                'Optimize Disk Space',
                'Memory Management'
            ]
        },
        {
            icon: Network,
            title: 'Network Optimization',
            description: 'Enhance connection performance',
            items: [
                'Network Latency Tweaks',
                'DNS Optimization',
                'TCP/IP Settings',
                'Connection Monitoring'
            ]
        },
        {
            icon: Cpu,
            title: 'Advanced Tweaks',
            description: 'Professional performance tools',
            items: [
                'NVIDIA Driver Updates',
                'CPU Core Management',
                'KBoost Configuration',
                'Core Isolation Settings'
            ]
        },
        {
            icon: RefreshCcw,
            title: 'System Protection',
            description: 'Safety and recovery options',
            items: [
                'Restore Point Creation',
                'Settings Backup',
                'Easy Revert Options',
                'Safe Mode Access'
            ]
        }
    ];

    const steps = [
        { icon: Download, title: 'Download', description: 'Get HeztroTweaker' },
        { icon: MousePointer, title: 'Run', description: 'Launch as admin' },
        { icon: Settings, title: 'Select', description: 'Choose optimization' },
        { icon: Zap, title: 'Done', description: 'Enjoy the performance' }
    ];

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
                    
                    <div className="text-center max-w-4xl mx-auto">
                        <div className="animate-slide-up space-y-6">
                            <h1 className="space-y-2">
                                <div className="text-4xl font-bold text-white/90">
                                    Windows optimization made
                                </div>
                                <div className="text-7xl font-bold text-gradient">
                                    Simple
                                </div>
                            </h1>
    
                            <div className="flex justify-center gap-4 mt-6">
                                <div className="animate-fade-in glass px-6 py-2 rounded-lg" style={{ animationDelay: '0.4s' }}>
                                    <span className="text-purple-accent font-medium">100% Free</span>
                                </div>
                                <div className="animate-fade-in glass px-6 py-2 rounded-lg" style={{ animationDelay: '0.6s' }}>
                                    <span className="text-purple-accent font-medium">Less than 10KB</span>
                                    <span className="text-white/60 text-sm ml-1">(0.01MB)</span>
                                </div>
                            </div>
                            
                            <p className="text-lg text-white/80 mb-8 animate-fade-in" style={{ animationDelay: '0.3s' }}>
                                Boost your PC's performance with just a few clicks
                            </p>
                            
                            <div className="flex gap-4 justify-center">
                                <button 
                                    onClick={() => window.location.href = 'https://github.com/Heztro/HeztroTweaker/releases/latest'}
                                    className="btn-primary px-6 py-3 rounded-lg flex items-center gap-2 animate-fade-in"
                                    style={{ animationDelay: '0.6s' }}>
                                    <Download size={20} className="group-hover:animate-bounce" />
                                    Download Now
                                </button>
                                <button 
                                    onClick={() => window.location.href = 'https://github.com/Heztro/HeztroTweaker'}
                                    className="glass px-6 py-3 rounded-lg flex items-center gap-2 hover:bg-white/10 transition-all duration-300 animate-fade-in"
                                    style={{ animationDelay: '0.7s' }}>
                                    <Github size={20} className="group-hover:rotate-12 transition-transform duration-300" />
                                    Source Code
                                </button>
                            </div>
                        </div>
                    </div>
                </header>
    
                {/* Steps Section */}
                <section className="container mx-auto px-6 py-16">
                    <div className="text-center mb-12 reveal">
                        <h2 className="text-3xl font-bold mb-4">How It Works</h2>
                        <p className="text-white/60">Simple steps to optimize your Windows</p>
                    </div>
                    <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
                        {steps.map((step, index) => (
                            <div key={index} 
                                 className="reveal glass feature-card p-6 text-center"
                                 style={{ animationDelay: `${index * 100}ms` }}>
                                <step.icon size={24} className="mx-auto mb-4 text-purple-accent feature-icon" />
                                <h3 className="font-bold mb-2">{step.title}</h3>
                                <p className="text-white/60 text-sm">{step.description}</p>
                                {index < steps.length - 1 && (
                                    <ArrowRight className="absolute right-0 top-1/2 -translate-y-1/2 translate-x-1/2 text-purple-accent/50 hidden md:block" />
                                )}
                            </div>
                        ))}
                    </div>
                </section>

{/* Main Features Section */}
                <section className="container mx-auto px-6 py-16">
                    <div className="text-center mb-12 reveal">
                        <h2 className="text-3xl font-bold mb-4">Core Features</h2>
                        <p className="text-white/60">Essential optimizations for every user</p>
                    </div>
                    <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                        {mainFeatures.map((feature, index) => (
                            <div key={index} 
                                 className="reveal glass feature-card p-6"
                                 style={{ animationDelay: `${index * 100}ms` }}>
                                <feature.icon size={24} className="text-purple-accent mb-4 feature-icon" />
                                <h3 className="font-bold mb-2">{feature.title}</h3>
                                <p className="text-white/60 mb-4">{feature.description}</p>
                                <ul className="space-y-2">
                                    {feature.items.map((item, idx) => (
                                        <li key={idx} className="flex items-center gap-2 text-white/80" 
                                            style={{ transitionDelay: `${idx * 50}ms` }}>
                                            <Check size={16} className="text-green-400 flex-shrink-0" />
                                            <span>{item}</span>
                                        </li>
                                    ))}
                                </ul>
                            </div>
                        ))}
                    </div>
                </section>
    
                {/* Advanced Features Section */}
                <section className="container mx-auto px-6 py-16">
                    <div className="text-center mb-12 reveal">
                        <h2 className="text-3xl font-bold mb-4">Advanced Optimizations</h2>
                        <p className="text-white/60">Professional tools for maximum performance</p>
                    </div>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                        {advancedFeatures.map((feature, index) => (
                            <div key={index} 
                                 className="reveal glass feature-card p-6"
                                 style={{ animationDelay: `${index * 100}ms` }}>
                                <div className="flex items-center gap-3 mb-4">
                                    <feature.icon size={24} className="text-purple-accent feature-icon" />
                                    <div>
                                        <h3 className="font-bold">{feature.title}</h3>
                                        <p className="text-sm text-white/60">{feature.description}</p>
                                    </div>
                                </div>
                                <ul className="space-y-2">
                                    {feature.items.map((item, idx) => (
                                        <li key={idx} className="flex items-center gap-2 text-white/80"
                                            style={{ transitionDelay: `${idx * 50}ms` }}>
                                            <Check size={16} className="text-green-400 flex-shrink-0" />
                                            <span>{item}</span>
                                        </li>
                                    ))}
                                </ul>
                            </div>
                        ))}
                    </div>
                </section>
    
                {/* CTA Section */}
                <section className="container mx-auto px-6 py-16">
                    <div className="reveal glass p-12 text-center relative overflow-hidden feature-card">
                        <div className="absolute inset-0 bg-gradient-to-r from-purple-light/10 to-purple-accent/10 opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
                        <h2 className="text-3xl font-bold mb-4 relative z-10">Ready to optimize?</h2>
                        <p className="mb-6 text-white/80 relative z-10">Experience the simplest way to boost your PC's performance</p>
                        <button 
                            onClick={() => window.location.href = 'https://github.com/Heztro/HeztroTweaker/releases/latest'}
                            className="btn-primary px-6 py-3 rounded-lg flex items-center gap-2 mx-auto relative z-10">
                            Get Started
                            <ChevronRight size={20} className="group-hover:translate-x-1 transition-transform duration-300" />
                        </button>
                    </div>
                </section>
    
                {/* Footer */}
                <footer className="container mx-auto px-6 py-8 border-t border-white/10">
                    <div className="text-center text-white/60">
                        <p>Made with ❤️ by Heztro</p>
                        <p className="mt-2">Open source software released under the MIT License</p>
                    </div>
                </footer>
            </div>
        );
    }
    
    // Initialize the app
    const root = document.getElementById('root');
    ReactDOM.render(<App />, root);
