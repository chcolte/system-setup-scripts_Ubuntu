#! /bin/bash


function ask_yes_no {
  while true; do
    echo -n "$* [Y/n]: "
    read ANS
    case $ANS in
      "" | [Yy]*)
        return 0
        ;;  
      [Nn]*)
        return 1
        ;;
    esac
  done
}





echo "install required software"
echo "----------------------------"
echo "| Required environment     |"
echo "| - .deb package support   |"
echo "| - flatpak                |"
echo "| - snap                   |"
echo "----------------------------"

read -p "Hit enter: "

mkdir tmp_install_required_software
cd tmp_install_required_software

# web browsers
# - google chrome
# - vivaldi
echo "----------------------------"
echo "| web browsers             |"
echo "| - google-chrome-stable   |"
echo "| - Vivaldi                |"
echo "----------------------------"

if ask_yes_no "install"; then
    # GoogleChrome(dpkg, deb package/stable on website)
    echo "---------- installing Google Chrome -----------"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb

    # Vivaldi(flatpak, stable on flathub)
    echo "---------- installing Vivaldi ----------"
    flatpak install -y flathub com.vivaldi.Vivaldi
else
    echo "No"   
fi



# text editors
# - Visual Studio Code
# - Neovim
echo "----------------------------"
echo "| text editors             |"
echo "| - Visual Studio Code     |"
echo "| - NeoVim                 |"
echo "----------------------------"

if ask_yes_no "install"; then
    # Visual Studio Code(apt, stable on official PPA)
    echo "---------- installing Visual Studio Code ----------"
    # add apt repository and signing key
    apt-get install -y wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    # install from repository
    apt install -y apt-transport-https
    apt update
    apt install -y code # or code-insiders
    
    # NeoVim(manual install, binary/stable on website)
    echo "---------- installing NeoVim ------------"
    wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    tar xzvf nvim-linux64.tar.gz
    # ここであってるのかどうか。opt/はどうなのか。　その他の例: https://go.dev/doc/install
    cp -r ./nvim-linux64 /usr/local/
    # シンボリックリンクを張る
    ln -s /usr/local/nvim-linux64/bin/nvim /usr/local/bin
    
    # 後処理
    rm -r nvim-linux64
    rm nvim-linux64.tar.gz
    
    # vim-plug
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

else
    echo "No"
fi


# IDE


# other development tools
# - git
# - Docker
echo "----------------------------"
echo "| other development tools  |"
echo "| - Git                    |"
echo "| - Docker                 |"
echo "----------------------------"

if ask_yes_no "install"; then
    # Git(apt, official PPA)
    echo "---------- installing git ----------"
    add-apt-repository -y ppa:git-core/ppa
    apt update
    apt install -y git
    
    #Docker(apt, official PPA)
    echo "---------- installing Docker ----------"
    apt-get install ca-certificates curl gnupg
    # register GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    # リポジトリ追加
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    # install
    apt-get update
    apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    
else
    echo "No"   
fi


# Communication tools
# - Discord
echo "----------------------------"
echo "| communication tools      |"
echo "| - Discord                |"
echo "----------------------------"

if ask_yes_no "install"; then

    # Discord(flatpak, flathub)
    echo "---------- installing Discord ----------"
    flatpak install -y flathub com.discordapp.Discord
    
else
    echo "No"
fi


# paint, image editing
# - GIMP
# - Inkscape
# - Krita
# - pinta
echo "---------------------------------"
echo "| painting, image editing tools |"
echo "| - GIMP                        |"
echo "| - Inkscape                    |"
echo "| - Krita                       |"
echo "| - pinta                       |"
echo "---------------------------------"

if ask_yes_no "install"; then

    # GIMP(apt, Ubuntu repository)
    echo "---------- installing GIMP ----------"
    apt install -y gimp
    
    # Inkscape(snap, latest/stable on snapstore)
    echo "---------- installing Inkscape ----------"
    snap install inkscape
    
    # Krita(flatpak, flathub)
    echo "---------- installing Krita ----------"
    flatpak install -y flathub org.kde.krita
    
    # Pinta(snap, latest/stable on snapstore)
    echo "---------- installing Pinta ----------"
    snap install pinta

else
    echo "No"   
fi


# 3D modeling
# - Blender
echo "----------------------------"
echo "| 3D modeling tool         |"
echo "| - Blender(4.0)           |"
echo "----------------------------"

if ask_yes_no "install"; then
    
    # Blender4.0
    echo "---------- installing Blender4.0.2 ----------"
    wget https://www.blender.org/download/release/Blender4.0/blender-4.0.2-linux-x64.tar.xz/
    tar Jxfv blender-4.0.2-linux-x64.tar.xz
    
    # ここであってるのかどうか。opt/はどうなのか。　その他の例: https://go.dev/doc/install
    cp -r ./blender-4.0.2-linux-x64 /usr/local/
    # シンボリックリンクを張る
    ln -s /usr/local/blender-4.0.2-linux-x64/blender /usr/local/bin
    
else
    echo "No"
fi

# Video Editing
# - kdenlive
echo "----------------------------"
echo "| Video Editiong tool      |"
echo "| - kdenlive               |"
echo "----------------------------"

if ask_yes_no "install"; then
	
    # kdenlive(apt, official PPA)
    echo "---------- installing kdenlive ----------"
    add-apt-repository ppa:kdenlive/kdenlive-stable
    apt update
    apt install kdenlive
    
else
    echo "No"
fi


# Utilities
# - keepassXC
# - onedrive
# - yt-dlp
# - ffmpeg
# - discord exporter(need .NET)
# - VLC media player
echo "----------------------------"
echo "| Utilities                |"
echo "| - keepassXC              |"
echo "| - onedrive               |"
echo "| - yt-dlp                 |"
echo "| - ffmpeg                 |"
echo "| - DiscordChatExporter    |"
echo "| - VLC media player       |"
echo "----------------------------"

# 以下、動作未確認

if ask_yes_no "install"; then

    # keepassXC(apt, official PPA)
    echo "---------- installing keepassXC ----------"
    add-apt-repository -y ppa:phoerious/keepassxc
    apt update
    apt install -y keepassxc
    
    # onedrive(apt)
    echo "---------- installing onedrive ----------"
    wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_22.04/Release.key | gpg --dearmor | tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_22.04/ ./" | tee /etc/apt/sources.list.d/onedrive.list
    apt-get update
    apt install -y onedrive
    
    # yt-dlp(manual install, release/latest binary on website)
    echo "---------- installing yt-dlp ----------"
    wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
    chmod a+rx /usr/local/bin/yt-dlp  # Make executable
    
    # ffmpeg(apt, Ubuntu repository)
    echo "---------- installing ffmpeg ----------"
    apt install -y ffmpeg
    
    # Discord Chat Exporter2.42.6
    echo "---------- installing Discord Chat Exporter(2.42.6) ----------"
    echo "★使用には.NET8.0が必要です。"
    wget https://github.com/Tyrrrz/DiscordChatExporter/releases/download/2.42.6/DiscordChatExporter.Cli.zip
    mkdir -p DiscordChatExporter/2.42.6
    unzip DiscordChatExporter.Cli.zip -d DiscordChatExporter/2.42.6
    cp -r ./DiscordChatExporter /usr/local/
    # シンボリックリンクを張る
    ln -s /usr/local/DiscordChatExporter/2.42.6/DiscordChatExporter.Cli.dll /usr/local/bin
    
    echo "---------- installing VLC media player ----------"
    apt -y install vlc
    
else
    echo "No"
fi


# Additionals
# - //Android Studio
# - //Unity Hub
# - //Unreal Engine5
# - //Davinch Resolve
# - //Microsoft Teams(PWA client)　debパッケージは廃止とのこと
# - //Virtual Box
# - nodeJS/nvm,npm
# - .NET 8.0
#echo "----------------------------"
#echo "| Additionals              |"
#echo "| - NodeJS                 |"
#echo "| - .NET 8.0               |"
#echo "----------------------------"
#
#if ask_yes_no "install"; then
#  
#else
#    echo "No"
#fi

# //uplatex(https://qiita.com/ocian/items/0e679e8bf72a39ada335)
# sudo apt-get install texlive-lang-japanese
# sudo apt-get install texlive-fonts-recommended
# sudo apt-get install texlive-fonts-extra
# sudo apt-get install xdvik-ja
# sudo apt-get install gv

# この方法でインストールした場合は漢字対応が完全でないため以下コマンドをpdf作成前に実行すると良い
# kanji-config-updmap-sys ipaex




cd ../
rm -r tmp_install_required_software/
exit 0
