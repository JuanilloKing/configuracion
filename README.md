# 🐧 Mi Debian Setup Script: Dev & Customization
Este repositorio contiene mi script personal de automatización para configurar un entorno de trabajo completo en Debian GNU/Linux con escritorio GNOME. Está diseñado para pasar de una instalación limpia a una estación de desarrollo lista para producir en minutos.

## 🚀 Cómo usarlo
Para ejecutar la configuración en un sistema nuevo, abre la terminal y lanza los siguientes comandos:

## Descargar el script
```bash
wget https://raw.githubusercontent.com/JuanilloKing/configuracion/main/setup.sh
```

## Dar permisos de ejecución
```bash
chmod +x setup.sh
```

## Ejecutar
```bash
./setup.sh
```

## 🛠️ ¿Qué instala este script?
El script automatiza la instalación y configuración de cuatro pilares fundamentales:

### 1. Terminal y Shell
Kitty: Emulador de terminal rápido y personalizable.

Zsh: Configurado como shell principal mediante el repositorio de ricpelo/conf.

Power Tools: lsd, bat, fzf, zoxide y neofetch.

### 2. Stack de Desarrollo
PHP & Laravel: PHP 8.2 con todas las extensiones necesarias y el instalador global de Laravel.

Flutter & Dart: SDK de Flutter (rama stable) y dependencias de compilación para Linux.

Python: Entorno base para scripts y automatización.

### 3. Bases de Datos y Software
Bases de Datos: PostgreSQL y DBeaver Community Edition.

Servidores: Instalador de XAMPP descargado y listo para usar.

Aplicaciones: Brave Browser, VS Code, Discord y Postman.

### 4. Entorno Visual (GNOME)
Integración total con el repositorio de configuración personalizada ~/.conf.

Extensiones de GNOME: Tiling Shell, Dash to Dock, Vitals, Clipboard Indicator y más.

## ⚠️ Pasos Manuales Obligatorios
Debido a permisos de seguridad o naturaleza de los instaladores, debes realizar estos pasos después de que el script termine:

### Instalar XAMPP: Ejecuta el instalador descargado en tu carpeta de descargas:

```bash
sudo ~/Downloads/xampp-linux-x64-8.2.12-0-installer.run
```

Cambiar la Shell: Para empezar a usar Zsh por defecto:
```bash
chsh -s $(which zsh)
```

### Configurar el PATH: Añade estas líneas al final de tu archivo ~/.zshrc para que Flutter y Laravel funcionen:

```bash
export PATH="$PATH:$HOME/development/flutter/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
```

Autenticación: Recuerda hacer login en GitHub CLI (gh auth login) y sincronizar tus extensiones de VS Code.

Nota: 
_Este script está diseñado para uso personal. Si decides usarlo, asegúrate de revisar las rutas de instalación y las versiones de los paquetes de PHP en el código._ :octocat:
