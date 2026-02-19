#!/bin/bash

# --- Colores ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🚀 Iniciando instalación completa (Debian + GNOME + Dev Stack)...${NC}"

# 1. Actualización inicial
sudo apt update && sudo apt upgrade -y

# 2. Dependencias de sistema y herramientas que vimos en tu lista
echo -e "${GREEN}📦 Instalando herramientas base...${NC}"
sudo apt install -y git curl wget build-essential kitty zsh fonts-firacode \
fzf ripgrep bat lsd zoxide neofetch xsel flatpak snapd unrar 7zip

# 3. Tu configuración personalizada (Repositorio Externo)
echo -e "${GREEN}⚙️ Aplicando tu configuración de ~/.conf...${NC}"
if [ ! -d "$HOME/.conf" ]; then
    git clone --recursive https://github.com/ricpelo/conf.git ~/.conf
    cd ~/.conf && ./conf.sh
    # Opcional: Ejecutar el script adicional que mencionaste
    # bash ~/.conf/scripts/scripts.sh
    cd ~
else
    echo "El directorio ~/.conf ya existe, saltando clonación."
fi

# 4. Entorno de Desarrollo: PHP y Laravel
echo -e "${GREEN}🐘 Configurando entorno PHP / Laravel...${NC}"
sudo apt install -y php8.2 php8.2-curl php8.2-xml php8.2-mysql php8.2-pgsql \
php8.2-sqlite3 php8.2-mbstring php8.2-zip php8.2-gd composer
# Instalador de Laravel globalmente
composer global require laravel/installer

# 5. Entorno de Desarrollo: Dart y Flutter
echo -e "${GREEN}💙 Configurando Flutter...${NC}"
sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev
if [ ! -d "$HOME/development/flutter" ]; then
    mkdir -p $HOME/development
    git clone https://github.com/flutter/flutter.git -b stable $HOME/development/flutter
fi

# 6. Bases de Datos y Servidores (PostgreSQL y XAMPP)
echo -e "${GREEN}🗄️ Configurando PostgreSQL y XAMPP...${NC}"
sudo apt install -y postgresql postgresql-contrib dbeaver-ce
# Descargar XAMPP
wget https://www.apachefriends.org/xampp-files/8.2.12/xampp-linux-x64-8.2.12-0-installer.run -P $HOME/Downloads
chmod +x $HOME/Downloads/xampp-linux-x64-8.2.12-0-installer.run

# 7. Aplicaciones Visuales (Brave, Discord, VS Code)
echo -e "${GREEN}🌐 Instalando Brave y aplicaciones...${NC}"
# Nota: Brave suele requerir añadir su repo, si ya lo tienes en tu lista de apt, esto funcionará:
sudo apt install -y code brave-browser discord postman

# 8. Limpieza
sudo apt autoremove -y

echo -e "${BLUE}✅ ¡Todo listo!${NC}"
echo -e "1. Recuerda que el instalador de XAMPP está en ~/Downloads."
echo -e "2. Aunque el script instaló configuraciones de i3, puedes seguir iniciando sesión en GNOME normalmente."
echo -e "3. No olvides añadir el PATH de Flutter a tu .zshrc si el repo de conf no lo hace."
