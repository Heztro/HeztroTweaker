import React, { useState, useEffect } from 'react';
import { Download, Settings, Shield, Zap, Check, ChevronRight, Github, MousePointer, ArrowRight, Lock, Cpu, Radio, MonitorCheck, Network, RefreshCcw, Trash2, Power } from 'lucide-react';

function App() {
  const [hoveredCard, setHoveredCard] = useState(null);
  
  useEffect(() => {
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
      items: [
        'Minimal - Basic tweaks & optimization',
        'Recommended - Balanced performance',
        'Extreme - Maximum performance',
      ]
    },
    {
      icon: Settings,
      title: 'Windows Optimization',
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
      items: [
        'Telemetry Control',
        'Privacy Enhancement',
        'Network Security',
        'Tracker Prevention'
      ]
    }
  ];

  const optimizationCategories = [
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

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-900 via-gray-800 to-gray-900 text-white overflow-hidden">
      <div className="fixed inset-0 bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-blue-600/20 via-transparent to-transparent animate-pulse-slow pointer-events-none" />
      
      <header className="relative container mx-auto px-6 py-16">
        <nav className="flex justify-between items-center mb-16 animate-fadeIn">
          <div className="text-2xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-blue-400 to-blue-600">
            HeztroTweaker
          </div>
          <button onClick={() => window.location.href = 'https://github.com/Heztro/HeztroTweaker'}
            className="flex items-center gap-2 hover:text-blue-400 transition-all duration-300">
            <Github size={20} />
            View on GitHub
          </button>
        </nav>
        
        <div className="text-center max-w-4xl mx-auto">
          <div className="animate-slideUp">
            <h1 className="space-y-2">
              <div className="text-4xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-white to-gray-300">
                Windows optimization made
              </div>
              <div className="text-6xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-blue-400 to-blue-600">
                Simple
              </div>
            </h1>

            <div className="flex justify-center gap-4 mt-6 mb-8">
              <div className="animate-slideRight opacity-0" style={{ animationDelay: '0.4s' }}>
                <div className="bg-white/5 backdrop-blur-md rounded-lg px-6 py-2 border border-white/10 shadow-lg relative overflow-hidden group transition-all duration-300 hover:bg-white/10">
                  <div className="absolute inset-0 bg-gradient-to-r from-blue-500/10 to-purple-500/10 opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
                  <span className="text-blue-300 font-medium relative z-10">100% Free</span>
                </div>
              </div>
              <div className="animate-slideLeft opacity-0" style={{ animationDelay: '0.4s' }}>
                <div className="bg-white/5 backdrop-blur-md rounded-lg px-6 py-2 border border-white/10 shadow-lg relative overflow-hidden group transition-all duration-300 hover:bg-white/10">
                  <div className="absolute inset-0 bg-gradient-to-r from-blue-500/10 to-purple-500/10 opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
                  <span className="text-blue-300 font-medium relative z-10">Less than 10KB</span>
                  <span className="text-gray-400 text-sm ml-1 relative z-10">(0.01MB)</span>
                </div>
              </div>
            </div>
            
            <p className="text-lg text-gray-300 mb-8 animate-fadeIn" style={{ animationDelay: '0.3s' }}>
              Boost your PC's performance with just a few clicks
            </p>
            
            <div className="flex gap-4 justify-center">
              <div className="animate-slideUp opacity-0" style={{ animationDelay: '0.6s' }}>
                <button 
                  onClick={() => window.location.href = 'https://github.com/Heztro/HeztroTweaker/releases/latest'}
                  className="group bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-lg flex items-center gap-2 transition-all duration-300 hover:shadow-lg hover:shadow-blue-600/20 relative overflow-hidden">
                  <div className="absolute inset-0 bg-gradient-to-r from-blue-400/0 via-blue-400/10 to-blue-400/0 translate-x-[-100%] group-hover:translate-x-[100%] transition-transform duration-1000" />
                  <Download size={20} className="group-hover:animate-bounce" />
                  <span className="relative z-10">Download Now</span>
                </button>
              </div>
              <div className="animate-slideUp opacity-0" style={{ animationDelay: '0.7s' }}>
                <button 
                  onClick={() => window.location.href = 'https://github.com/Heztro/HeztroTweaker'}
                  className="group bg-gray-700 hover:bg-gray-600 text-white font-bold py-3 px-6 rounded-lg flex items-center gap-2 transition-all duration-300 hover:shadow-lg hover:shadow-gray-600/20 relative overflow-hidden">
                  <div className="absolute inset-0 bg-gradient-to-r from-gray-400/0 via-gray-400/10 to-gray-400/0 translate-x-[-100%] group-hover:translate-x-[100%] transition-transform duration-1000" />
                  <Github size={20} className="group-hover:rotate-12 transition-transform duration-300" />
                  <span className="relative z-10">Source Code</span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </header>

      <section className="container mx-auto px-6 py-16">
        <div className="text-center mb-12 reveal">
          <h2 className="text-3xl font-bold mb-4">How It Works</h2>
          <p className="text-gray-400">Simple steps to optimize your Windows</p>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
          {steps.map((step, index) => (
            <div key={index} className="reveal bg-white/5 backdrop-blur-sm p-6 rounded-lg text-center relative group hover:bg-white/10 transition-all duration-300"
                 style={{ animationDelay: `${index * 100}ms` }}>
              <step.icon size={24} className="mx-auto mb-4 text-blue-500 group-hover:scale-110 transition-transform duration-300" />
              <h3 className="font-bold mb-2">{step.title}</h3>
              <p className="text-gray-400 text-sm">{step.description}</p>
              {index < steps.length - 1 && (
                <ArrowRight className="absolute right-0 top-1/2 -translate-y-1/2 translate-x-1/2 text-blue-500/50 hidden md:block" />
              )}
            </div>
          ))}
        </div>
      </section>

      <section className="container mx-auto px-6 py-16">
        <div className="text-center mb-12 reveal">
          <h2 className="text-3xl font-bold mb-4">Core Features</h2>
          <p className="text-gray-400">Essential optimizations for every user</p>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {mainFeatures.map((feature, index) => (
            <div key={index} 
                 className="reveal bg-white/5 backdrop-blur-sm p-6 rounded-lg relative group hover:bg-white/10 transition-all duration-300"
                 style={{ animationDelay: `${index * 100}ms` }}>
              <feature.icon size={24} className="text-blue-500 mb-4 group-hover:scale-110 transition-transform duration-300" />
              <h3 className="font-bold mb-4">{feature.title}</h3>
              <ul className="space-y-2">
                {feature.items.map((item, idx) => (
                  <li key={idx} className="flex items-center gap-2 text-gray-300 group-hover:translate-x-2 transition-transform duration-300" 
                      style={{ transitionDelay: `${idx * 50}ms` }}>
                    <Check size={16} className="text-green-500 flex-shrink-0" />
                    <span>{item}</span>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>
      </section>

      <section className="container mx-auto px-6 py-16">
        <div className="text-center mb-12 reveal">
          <h2 className="text-3xl font-bold mb-4">Advanced Optimizations</h2>
          <p className="text-gray-400">Professional tools for maximum performance</p>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {optimizationCategories.map((category, index) => (
            <div key={index} 
                 className="reveal bg-white/5 backdrop-blur-sm p-6 rounded-lg relative group hover:bg-white/10 transition-all duration-300"
                 style={{ animationDelay: `${index * 100}ms` }}>
              <div className="flex items-center gap-3 mb-4">
                <category.icon size={24} className="text-blue-500 group-hover:scale-110 transition-transform duration-300" />
                <div>
                  <h3 className="font-bold">{category.title}</h3>
                  <p className="text-sm text-gray-400">{category.description}</p>
                </div>
              </div>
              <ul className="space-y-2">
                {category.items.map((item, idx) => (
                  <li key={idx} className="flex items-center gap-2 text-gray-300 group-hover:translate-x-2 transition-transform duration-300"
                      style={{ transitionDelay: `${idx * 50}ms` }}>
                    <Check size={16} className="text-green-500 flex-shrink-0" />
                    <span>{item}</span>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>
      </section>

      <section className="container mx-auto px-6 py-16">
        <div className="reveal bg-gradient-to-r from-blue-600 to-blue-800 rounded-lg p-8 text-center relative overflow-hidden group">
          <div className="absolute inset-0 bg-[radial-gradient(circle_at_top_right,_var(--tw-gradient-stops))] from-white/10 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
          <h2 className="text-3xl font-bold mb-4 relative z-10">Ready to optimize?</h2>
          <p className="mb-6 relative z-10">Experience the simplest way to boost your PC's performance</p>
          <button 
            onClick={() => window.location.href = 'https://github.com/Heztro/HeztroTweaker/releases/latest'}
            className="group bg-white text-blue-600 font-bold py-3 px-6 rounded-lg flex items-center gap-2 mx-auto transition-all duration-300 hover:bg-gray-100 relative z-10">
            Get Started
            <ChevronRight size={20} className="group-hover:translate-x-1 transition-transform duration-300" />
          </button>
        </div>
      </section>

      <footer className="container mx-auto px-6 py-8 border-t border-gray-800/50">
        <div className="text-center text-gray-400">
          <p>Made with ❤️ by Heztro</p>
          <p className="mt-2">Open source software released under the MIT License</p>
        </div>
      </footer>

      <style jsx global>{`
        .reveal {
          opacity: 0;
          transform: translateY(20px);
          transition: all 0.6s cubic-bezier(0.4, 0, 0, 1);
        }

        .reveal.animate-in {
          opacity: 1;
          transform: translateY(0);
        }

        @keyframes fadeIn {
          from { opacity: 0; }
          to { opacity: 1; }
        }

        @keyframes slideUp {
          from { 
            opacity: 0;
            transform: translateY(20px);
          }
          to { 
            opacity: 1;
            transform: translateY(0);
          }
        }

        @keyframes slideRight {
          from { 
            opacity: 0;
            transform: translateX(-20px);
          }
          to { 
            opacity: 1;
            transform: translateX(0);
          }
        }

        @keyframes slideLeft {
          from { 
            opacity: 0;
            transform: translateX(20px);
          }
          to { 
            opacity: 1;
            transform: translateX(0);
          }
        }

        .animate-fadeIn {
          animation: fadeIn 0.6s ease-out forwards;
        }

        .animate-slideUp {
          animation: slideUp 0.6s ease-out forwards;
        }

        .animate-slideRight {
          animation: slideRight 0.6s ease-out forwards;
        }

        .animate-slideLeft {
          animation: slideLeft 0.6s ease-out forwards;
        }

        .animate-pulse-slow {
          animation: pulse-slow 4s cubic-bezier(0.4, 0, 0.6, 1) infinite;
        }

        @keyframes pulse-slow {
          0%, 100% { opacity: 0.1; }
          50% { opacity: 0.3; }
        }
      `}</style>
    </div>
  );
}

export default App;
ReactDOM.render(<App />, document.getElementById('root'));
