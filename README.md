# Factorio Dedicated Server
Set up a Factorio dedicated server with mods

## Getting Started
1. Install Docker
    - https://www.docker.com/get-started
2. Forward port 34197 for UDP
    - https://wiki.factorio.com/Multiplayer
3. Clone this repo
    - `git clone https://github.com/Outc4sted/factorio-starter.git`
4. Copy your initial saved game to `./factorio-starter/server/saves`
    - Saved files are found in `%appdata%\Factorio\saves`
5. Copy your mods to `./factorio-starter/server/mods`
    - Mods are found in `%appdata%\Factorio\mods`
6. In `docker-compose.yaml` set your saved game name
    - `SAVE_FILE: your-saved-game.zip`
7. In `server/server-settings.json` set your game name, account, and token along with any other settings
    - Your account and token information can be found in your profile on [factorio.com](https://factorio.com/profile)
8. Run docker-compose to build the Docker image and start the container
    - `docker compose up -d`
