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
