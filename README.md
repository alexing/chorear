# chorear

This repository provides a simple setup script to install [Zotify](https://github.com/zotify-dev/zotify) and create a convenient global command `chorear` to download Spotify tracks on macOS — with your preferred flags already configured.

## 🚀 Setup Instructions

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yourusername/chorear-setup.git
   cd chorear-setup
   ```

2. **Run the Setup Script:**

   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

3. **Download Songs with One Command:**

   ```bash
   chorear https://open.spotify.com/track/<track-id>
   ```

   The songs will be downloaded directly into your current directory with unique filenames in this format:

   ```
   Artist Name - Song Title [spotifyTrackID].mp3
   ```

---

## 🔧 What's Included

- Installs Homebrew (if not already installed)
- Installs Python 3.11, pipx, ffmpeg, and git
- Installs the latest Zotify from GitHub via pipx
- Creates a system-wide command `chorear` with the following flags:

```bash
zotify <link> \
  --root-path . \
  --md-allgenres=True \
  --download-format mp3 \
  --download-quality very_high \
  --print-downloads=True \
  --output "{artist} - {song_name} [{id}].{ext}"
```

---

## 🎧 First-Time Use: Spotify Login

The first time you use `chorear`, it will open your browser to authenticate with Spotify. This creates a token locally at `~/.cache-zotify` so you won’t have to log in again.

If you prefer to use your own Spotify Developer credentials, you can set these environment variables in your shell config:

```bash
export SPOTIPY_CLIENT_ID='your_client_id'
export SPOTIPY_CLIENT_SECRET='your_client_secret'
export SPOTIPY_REDIRECT_URI='http://localhost:8888/callback'
```

---

## 🛠️ Requirements

- macOS
- Admin privileges (for installing packages and creating global commands)
- Python & pipx
- Spotify account

---

## ⚠️ Disclaimer

This script is intended for educational and personal use only. Please make sure you comply with Spotify’s [terms of use](https://www.spotify.com/legal/end-user-agreement/) when using this tool.
