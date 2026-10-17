# chorear

This repository provides a simple setup script to install [Zotify](https://github.com/Googolplexed0/zotify) (the actively maintained fork) and create a convenient global command `chorear` to download Spotify tracks on macOS — with your preferred flags already configured.

## 🚀 Setup Instructions

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/alexing/chorear.git
   cd chorear
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
   or
   ```bash
   chorear https://open.spotify.com/playlist/<playlist-id>
   ```
   etc.
   
   The songs will be downloaded directly into your current directory with unique filenames in this format: `Artist Name-Song Title.mp3`

---

## 🔧 What's Included

- Installs Homebrew (if not already installed)
- Installs pipx, ffmpeg, and git
- Installs the latest Zotify from the [Googolplexed0 fork](https://github.com/Googolplexed0/zotify) via pipx
- Creates a system-wide command `chorear` with the following flags:

```bash
zotify <link> \
  --root-path . \
  --md-allgenres=True \
  --download-format mp3 \
  --download-quality auto \
  --lyrics-to-file=False \
  --print-downloads=True \
  --output "{artist}-{song_name}"
```
Check [Zotify's documentation](https://github.com/Googolplexed0/zotify) if you want to play with these parameters.

`auto` quality downloads at 320 kbps with Spotify Premium and 160 kbps with a free account.

## 🔄 Updating Zotify

When Spotify breaks things again, update to the latest version of the fork:

```bash
pipx install --force git+https://github.com/Googolplexed0/zotify.git
```

Don't run `pipx` with `sudo` — it makes `~/.local` owned by root and later updates fail with `Permission denied`.

---

## 🎧 First-Time Use: Spotify Login

The first time you use `chorear`, it prints a Spotify login link. Open it in your browser and log in; the credentials are saved in `~/Library/Application Support/Zotify` so you won't have to log in again.

Downloading by link works out of the box. Searching (`chorear -s "song name"`) and downloading your Liked Songs need your own [Spotify Developer App](https://developer.spotify.com/dashboard) — pass its Client ID once with `chorear --client-id <your_client_id> ...`.

---

## 🛠️ Requirements

- macOS
- Admin privileges (for installing packages and creating global commands)
- Spotify account (Premium for 320 kbps)

---

## ⚠️ Disclaimer

This script is intended for educational and personal use only. Please make sure you comply with Spotify’s [terms of use](https://www.spotify.com/legal/end-user-agreement/) when using this tool.
