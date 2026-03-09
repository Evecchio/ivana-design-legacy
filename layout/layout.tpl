<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>{{ page_title }}</title>
    
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#e6007e",
                        "background-light": "#f8f6f6",
                        "background-dark": "#221610",
                    },
                    fontFamily: {
                        "display": ["Public Sans"]
                    },
                    borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
                },
            },
        }
    </script>
    <style>
        body {
            font-family: 'Public Sans', sans-serif;
        }
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
    </style>
    <style data-purpose="custom-colors">
        :root {
            --brand-pink: #e6007e;
            --brand-pink-hover: #c5006d;
        }
        .bg-brand-pink { background-color: var(--brand-pink); }
        .text-brand-pink { color: var(--brand-pink); }
        .border-brand-pink { border-color: var(--brand-pink); }
    </style>

    {% head_content %}
</head>

<body class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-slate-100 font-display">
    <div class="layout-container flex h-full grow flex-col">
        
        <div class="bg-brand-pink text-white py-2 text-center text-xs font-bold tracking-widest uppercase" data-purpose="announcement-bar">
            🔥 HASTA 40% OFF | 3 CUOTAS SIN INTERÉS | 10% OFF TRANSFERENCIA 🔥
        </div>
        <header class="border-b border-gray-100 sticky top-0 bg-white z-50">
            <div class="container mx-auto px-4 py-4 flex items-center justify-between">
                <div class="flex-shrink-0">
                    <a href="{{ store.url }}">
                        <h1 class="text-3xl font-bold italic tracking-tighter">ivana <span class="font-light not-italic">Design</span></h1>
                    </a>
                </div>
                
                <div class="flex-grow max-w-xl mx-8">
                    <form action="{{ store.search_url }}" method="get" class="relative">
                        <input class="w-full border-gray-200 rounded-full py-2 px-6 focus:ring-brand-pink focus:border-brand-pink" type="text" name="q" value="{{ search.query }}" placeholder="¿Qué estás buscando?" />
                        <button type="submit" class="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 hover:text-brand-pink">
                            <svg class="h-5 w-5" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                            </svg>
                        </button>
                    </form>
                </div>
                
                <div class="flex items-center space-x-6 text-sm">
                    <a class="flex items-center hover:text-brand-pink text-gray-800" href="{{ store.customer_login_url }}">
                        <svg class="h-5 w-5 mr-1" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
                        Entrar
                    </a>
                    <a class="flex items-center hover:text-brand-pink text-gray-800" href="{{ store.customer_register_url }}">
                        <svg class="h-5 w-5 mr-1" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
                        Registrarse
                    </a>
                    <a class="flex items-center text-brand-pink font-bold" href="{{ store.cart_url }}">
                        <svg class="h-6 w-6 mr-1" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
                        CARRO ({{ cart.items_count }}) <span class="text-xs ml-1">{{ cart.total | money }}</span>
                    </a>
                </div>
            </div>
            
            <nav class="border-t border-gray-100 py-3">
                <ul class="flex justify-center space-x-8 text-xs font-bold tracking-wider text-gray-600">
                    {% for item in menus[settings.main_menu] %}
                        <li><a class="hover:text-brand-pink uppercase" href="{{ item.url }}">{{ item.name }}</a></li>
                    {% endfor %}
                </ul>
            </nav>
        </header>

       {% template_content %}

        <footer class="bg-brand-pink text-white pt-16 pb-8 mt-12">
            <div class="container mx-auto px-4 grid grid-cols-1 md:grid-cols-4 gap-12">
                <div class="space-y-6">
                    <div class="flex space-x-4">
                        <a class="hover:opacity-80" href="#">
                            <svg class="w-5 h-5 fill-current" viewbox="0 0 24 24"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"></path></svg>
                        </a>
                        <a class="hover:opacity-80" href="#">
                            <svg class="w-5 h-5 fill-current" viewbox="0 0 24 24"><path d="M22.675 0h-21.35c-.732 0-1.325.593-1.325 1.325v21.351c0 .731.593 1.324 1.325 1.324h11.495v-9.294h-3.128v-3.622h3.128v-2.671c0-3.1 1.893-4.788 4.659-4.788 1.325 0 2.463.099 2.795.143v3.24l-1.918.001c-1.504 0-1.795.715-1.795 1.763v2.313h3.587l-.467 3.622h-3.12v9.293h6.116c.73 0 1.323-.593 1.323-1.324v-21.35c0-.732-.593-1.325-1.325-1.325z"></path></svg>
                        </a>
                    </div>
                    <div class="space-y-3 text-sm">
                        <p>5491124769969</p>
                        <p>+54 1124769969</p>
                        <p>ivanadesignoficial@gmail.com</p>
                        <p>ALVEAR 2531 | Villa Ballester</p>
                    </div>
                </div>
                <nav class="space-y-2 text-sm font-light">
                    <a class="block hover:underline" href="{{ store.url }}">Inicio</a>
                    <a class="block hover:underline" href="{{ store.products_url }}">Productos</a>
                    <a class="block hover:underline" href="{{ store.contact_url }}">Contacto</a>
                </nav>
                <div class="col-span-1 md:col-span-2 space-y-4">
                    <h4 class="font-bold text-lg">Newsletter</h4>
                    <form class="flex max-w-md" action="{{ contact.newsletter_action }}" method="post">
                        <input class="flex-grow bg-brand-pink border-white text-white placeholder-white focus:ring-white focus:border-white py-2 px-4 rounded-l" name="email" placeholder="Email" type="email" required/>
                        <button class="bg-white text-brand-pink font-bold px-6 py-2 rounded-r hover:bg-gray-100 transition-colors" type="submit">Enviar</button>
                    </form>
                </div>
            </div>
            <div class="max-w-[1440px] mx-auto mt-12 pt-8 border-t border-white/20 flex flex-col md:flex-row justify-between items-center gap-4 text-[10px] opacity-80">
                <p>© 2026 Ivana Design. Todos los derechos reservados.</p>
                <div class="flex gap-6">
                    <a class="hover:underline" href="#">Defensa de las y los consumidores. Para reclamos ingresá acá.</a>
                    <a class="hover:underline" href="#">Botón de arrepentimiento</a>
                </div>
            </div>
        </footer>
    </div>
    
   {% body_content %}
</body>
</html>
