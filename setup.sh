#!/bin/bash

set -e  # Exit on error

echo "🔧 Installing prerequisites..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install python@3.11 pipx ffmpeg git

echo "🔧 Setting up pipx..."
pipx ensurepath

echo "🔧 Installing Zotify..."
# Actively maintained Zotify fork (the original zotify-dev/zotify broke with Spotify API changes).
# Do not run pipx with sudo: it makes ~/.local owned by root and later updates fail.
pipx install --force git+https://github.com/Googolplexed0/zotify.git

echo "📂 Creating /usr/local/bin/chorear script..."
sudo tee /usr/local/bin/chorear > /dev/null << 'EOF'
#!/bin/bash
exec zotify "$@" --output "{artist}-{song_name}" --root-path . --md-allgenres=True --download-format mp3 --download-quality very_high --lyrics-to-file=False --print-downloads=True
EOF

sudo chmod +x /usr/local/bin/chorear

echo "✅ Setup complete! You can now use 'chorear <spotify-link>' to download tracks."
