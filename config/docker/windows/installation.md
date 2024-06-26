# Preparando o ambiente Windows para ROS + Coppelia Sim

## Requisitos

Para instalar os programas no windows é necessário possuir:

- 64-bit Windows 10/11 - Versão Home, Empresarial ou Pro
- TLS 1.2 ativado

## Pacotes

### Chocolatey

Chocolatey é um gerenciador de pacotes para o Windows, similar ao apt-get do Linux. Ele facilita a instalação, atualização e gerenciamento de softwares e bibliotecas no sistema operacional Windows. Usando o Chocolatey, você pode instalar aplicativos e ferramentas diretamente da linha de comando, simplificando o processo e garantindo que você tenha as versões mais recentes dos programas. Para instalar o Chocolatey, você pode usar um comando no PowerShell com privilégios administrativos, e após a instalação, gerenciar pacotes fica muito mais fácil e eficiente.

Abrir o Powersheel com privilégios de administrador e executar o comando: 

```sheel
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Fechar e abrir o terminal e digitar ```choco``` para verificar se a instalação aconteceu corretamente

Instale o python e algumas distribuições necessárias abrindo o terminal com privilégios de administrador:

```bash
choco install -y python --version 3.8.3
choco install -y vcredist2013 vcredist140

choco install -y openssl --version 1.1.1.2100
setx /m OPENSSL_CONF "C:\Program Files\OpenSSL-Win64\bin\openssl.cfg"

choco upgrade git -y
choco install -y cmake wget 7zip wingetUI chocolateyGUI graphviz

cd "%UserProfile%\Downloads"

wget https://github.com/ros2/choco-packages/releases/download/2022-03-15/asio.1.12.1.nupkg
wget https://github.com/ros2/choco-packages/releases/download/2022-03-15/bullet.3.17.nupkg
wget https://github.com/ros2/choco-packages/releases/download/2022-03-15/cunit.2.1.3.nupkg
wget https://github.com/ros2/choco-packages/releases/download/2022-03-15/eigen.3.3.4.nupkg
wget https://github.com/ros2/choco-packages/releases/download/2022-03-15/tinyxml2.6.0.0.nupkg

choco install -y -s "%UserProfile%\Downloads" asio cunit eigen tinyxml2 bullet

python -m pip install -U pip setuptools
python -m pip install -U catkin_pkg cryptography empy importlib-metadata jsonschema lark==1.1.1 lxml matplotlib netifaces numpy opencv-python PyQt5 pillow psutil pycairo pydot pyparsing==2.4.7 pytest pyyaml rosdistro

wget https://www.zlatkovic.com/pub/libxml/64bit/libxml2-2.9.3-win32-x86_64.7z
wget https://www.zlatkovic.com/pub/libxml/64bit/iconv-1.14-win32-x86_64.7z
wget https://www.zlatkovic.com/pub/libxml/64bit/zlib-1.2.8-win32-x86_64.7z

terminar!!!!
```

### Visual Studio Community 2019

Baixe o Visual Studio Community do [https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=16&src=myvs&utm_medium=microsoft&utm_source=my.visualstudio.com&utm_campaign=download&utm_content=vs+community+2019](link)

Verifique no processo de instalação se a caixa "Desktop development with C++" está ativado.

### OpenCV 

Baixe o OpenCv do [https://opencv.org/releases/](link) e durante a instalação coloque em C:\opencv

### Robot Operating System (ROS)

No terminal com privilégios de administrador: 

```bash
mkdir c:\opt\chocolatey
set ChocolateyInstall=c:\opt\chocolatey
choco source add -n=ros-win -s="https://aka.ms/ros/public" --priority=1
choco upgrade ros-humble-desktop -y --execution-timeout=0 --pre
```

### Coppelia Sim

Baixe o Coppelia Sim edu do [https://www.coppeliarobotics.com](link)

No terminal com privilégios de administrador: 

```bash
setx /m COPPELIASIM_ROOT_DIR "C:\Program Files\CoppeliaRobotics\CoppeliaSimEdu"

cd "%UserProfile%\Downloads"
wget https://archives.boost.io/release/1.78.0/source/boost_1_78_0.7z
7zip ...
cd "C:\boost\boost_1_78_0"
bootstrap
b2 toolset=msvc

setx /m BOOST_ROOT "C:\boost\boost_1_78_0"
setx /m BOOST_LIBRARYDIR "C:\boost\boost_1_78_0\stage\lib"
```

### Configurações finais

adicione no PATH os caminhos:

- C:\Program Files\OpenSSL-Win64\bin\
- C:\opencv\x64\vc16\bin
- C:\xmllint\bin

## Criando o workspace

Abra o terminal "x64 Native Tools Command Prompt for VS 2019" com privilégios de adminstrador:

```bash
c:\opt\ros\humble\x64\setup.bat
cd "%UserProfile%\Desktop" 
mkdir -p "ros2_ws\src"
cd ros2_ws\src

git clone https://github.com/CDC-IA/senai_models.git
git clone https://github.com/CoppeliaRobotics/simROS2.git sim_ros2_interface

pip install xmlschema
choco install -y xsltproc

cd ..
colcon build
```

Após construído é possível carregar os pacotes do workspace - Abra o terminal "x64 Native Tools Command Prompt for VS 2019" com privilégios de adminstrador:

```bash
c:\opt\ros\humble\x64\setup.bat
%UserProfile%\Desktop\ros2_ws\install\local_setup.bat 
```

Começe a usar os comandos do ros2 no Windows :)