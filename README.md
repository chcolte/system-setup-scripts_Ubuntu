# system-setup-scripts_Ubuntu
Ubuntu系OS設定用のbashファイル

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

### スクリプトの実行方法

1. 必要な環境を確認してください:
   - .debパッケージサポート
   - flatpak
   - snap

2. リポジトリをクローンし、ディレクトリに移動します:
   ```bash
   git clone <repository_url>
   cd system-setup-scripts_Ubuntu
   ```

3. スクリプトを実行可能にします:
   ```bash
   chmod +x install_required_software.sh
   ```

4. スクリプトを実行します:
   ```bash
   ./install_required_software.sh
   ```

5. プロンプトに従って、インストールしたいソフトウェアカテゴリを選択します。

### 動作確認環境

- ZorinOS17
