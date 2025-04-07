#!/bin/bash

set -e  # Exit on error

echo "🔧 Installing prerequisites..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install python@3.11 pipx ffmpeg git

echo "🔧 Setting up pipx..."
pipx ensurepath

echo "🔧 Installing Zotify..."
pipx install git+https://github.com/zotify-dev/zotify

echo "📂 Creating /usr/local/bin/chorear script..."
sudo tee /usr/local/bin/chorear > /dev/null << 'EOF'
#!/bin/bash
exec zotify "$1" --output "{artist}-{song_name}.{ext}" --root-path . --md-allgenres=True --download-format mp3 --download-quality very_high --print-downloads=True
EOF

sudo chmod +x /usr/local/bin/chorear

echo "✅ Setup complete! You can now use 'chorear <spotify-link>' to download tracks."
