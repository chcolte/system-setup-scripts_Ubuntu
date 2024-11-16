# system-setup-scripts_Ubuntu
Ubuntu系OS設定用のbashファイル

## set_OS_config.sh

このスクリプトは、Ubuntu系DesktopOSの一般利用に必須の設定変更を自動化するためのものです。現状では、以下の設定項目があります。

- ハードウェアクロックの設定（Windowsと共存するためにローカル時刻に設定）

## install_required_software.sh

このスクリプトは、`apt`、`snap`、`flatpak`などの異なるパッケージマネージャを使用して、さまざまなソフトウェアパッケージをインストールします。各カテゴリのソフトウェアをインストールする前に、確認が入ります。

### インストールされるソフトウェアのカテゴリ

- ウェブブラウザ
  - Google Chrome
  - Vivaldi
- テキストエディタ
  - Visual Studio Code
  - Neovim
- その他の開発ツール
  - Git
  - Docker
- コミュニケーションツール
  - Discord
- 画像編集ツール
  - GIMP
  - Inkscape
  - Krita
  - Pinta
- 3Dモデリングツール
  - Blender
- ビデオ編集ツール
  - Kdenlive
- ユーティリティ
  - KeepassXC
  - Onedrive
  - yt-dlp
  - ffmpeg
  - DiscordChatExporter
  - VLCメディアプレーヤー

### 必要環境
- debパッケージサポート
- flatpak
- snap


### 動作確認環境

- ZorinOS17

## 使い方
1. クローンします：
2. 使いたいスクリプトを実行可能にします:
   ```bash
   chmod +x install_required_software.sh
   ```

3. 使いたいスクリプトを実行します:
   ```bash
   ./install_required_software.sh
   ```

4. プロンプトに従って、インストールしたいソフトウェアカテゴリを選択します。

