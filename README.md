# <img src="media/logo.png" width="25" height="25"> <span style="color: #94499b;">F</span><span style="color: #ffffff;">ort</span><span style="color: #94499b;">n</span><span style="color: #ffffff;">ite </span><span style="color: #94499b;">L</span><span style="color: #ffffff;">evel-</span><span style="color: #94499b;">U</span><span style="color: #ffffff;">p</span><span style="color: #94499b;">!</span>

![FNLU Logo](media/logo.png)

## <img src="media/logo.png" height="20" alt="FNLU logo"> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods</span> <span style="color: #3598db;">-</span> [<span style="color: #8b4b5c;">R</span><span style="color: #6b8fb0;">ealm</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span>](https://realmgx.com) <span style="color: #94499b;">Community Project</span>

***

## <span style="color: #94499b;">🎯 Overview</span>

**Fortnite Level-Up! (FNLU)** replaces World of Warcraft's configured default level-up sound with a Fortnite-inspired chime whenever the player gains a level. It is a small, automatic sound addon built on RGX-Framework.

![RealmGX Kiwi](media/kiwi.gif) **<span style="color: #2dc26b;">The Kiwi Says:</span>** <span style="color: #b96ad9;">"Victory Royale! Bwwiiiee."</span>

***

## <span style="color: #94499b;">⚠️ Deprecation Notice</span>

<span style="color: #ff6b6b;">**This addon is no longer receiving updates.**</span> Its functionality and Fortnite sound are available in [BLU | Better Level Up!](https://www.curseforge.com/wow/addons/blu-better-level-up) and [BLU Classic | Better Level Up!](https://www.curseforge.com/wow/addons/blu-classic), which combine this sound with a larger sound collection.

Existing standalone users may continue to use this repository as-is, but new installations should prefer the appropriate BLU addon.

***

## <span style="color: #94499b;">✨ Behavior and Features</span>

- Plays the selected Fortnite-inspired sound on `PLAYER_LEVEL_UP`.
- Provides high, medium, and low OGG variants; medium is selected by default.
- Plays through the Master sound channel by default.
- Requests that RGX-Framework mute the configured default level-up sound while FNLU is enabled.
- Persists enablement and sound-variant choices in `FNLUSettings`.
- Shows a welcome message on login while that saved preference remains enabled.
- Includes a test command for checking playback immediately.

FNLU does not alter leveling, experience gains, UI frames, or game data. It only handles the sound associated with the player's level-up event.

***

## <span style="color: #94499b;">🎮 Requirements and Compatibility</span>

`RGX-Framework` is a required dependency and must be installed and enabled. The current TOCs declare these game interfaces:

| WoW flavor | TOC | Interface |
|---|---|---:|
| Retail | `FortniteLevelUp.toc` | `120007` |
| Wrath Classic | `FortniteLevelUp_Wrath.toc` | `30403` |
| Burning Crusade Classic | `FortniteLevelUp_TBC.toc` | `20504` |
| Classic Era | `FortniteLevelUp_Vanilla.toc` | `11500` |

These values describe the preserved release metadata. The addon is deprecated, so they are not a promise of compatibility with later game clients.

***

## <span style="color: #94499b;">📥 Installation</span>

1. Download a packaged release of FortniteLevelUp and install RGX-Framework.
2. Extract both addon folders into the WoW client's `Interface/AddOns` directory.
3. Confirm that the folder is named `FortniteLevelUp` rather than a source-archive name.
4. Enable `RGX-Framework` and `Fortnite Level-Up!` at the character-selection AddOns screen.

For the consolidated replacement, install BLU or BLU Classic instead of the standalone addon.

***

## <span style="color: #94499b;">⌨️ Usage and Configuration</span>

FNLU works automatically once enabled. It has no graphical configuration panel; use `/fnlu` commands in chat:

| Command | Result |
|---|---|
| `/fnlu` or `/fnlu help` | List available commands. |
| `/fnlu test` | Play the selected sound variant. |
| `/fnlu enable` | Enable replacement playback. |
| `/fnlu disable` | Disable replacement playback. |
| `/fnlu high` | Select the high-quality file. |
| `/fnlu med` or `/fnlu medium` | Select the medium-quality file. |
| `/fnlu low` | Select the low-quality file. |

The initial defaults are enabled, medium quality, Master-channel playback, default-sound muting, and the welcome message. Settings persist between sessions in `FNLUSettings`.

***

## <span style="color: #94499b;">🧩 Files and Runtime</span>

- `data/locales.lua` defines chat and welcome text.
- `data/core.lua` registers the sound set, events, saved settings, and `/fnlu` command.
- `sounds/fortnite_{high,med,low}.ogg` are the active playback files.
- `media/icon.tga`, `media/logo.png`, and `media/kiwi.gif` provide addon and project artwork.

At addon load, FNLU initializes its RGX-Framework sound handle. At login it displays the optional welcome message. Each later `PLAYER_LEVEL_UP` event plays the selected variant when the addon is enabled, and logout allows the framework handle to finalize its state.

***

## <span style="color: #94499b;">🛠️ Troubleshooting</span>

- If WoW marks FNLU as missing a dependency, install or enable `RGX-Framework`.
- If no custom sound plays, run `/fnlu test`, then `/fnlu enable` and select a variant again.
- If the default sound also plays, verify that FNLU and RGX-Framework both loaded without Lua errors.
- If WoW cannot find the addon, verify the exact `Interface/AddOns/FortniteLevelUp` folder name.

Because the standalone project is retired, migrate to BLU or BLU Classic when you prefer the consolidated sound addon.

***

## <span style="color: #94499b;">🔗 Project Links</span>

- [Repository](https://github.com/RGXMods/FortniteLevelUp)
- [Releases](https://github.com/RGXMods/FortniteLevelUp/releases)
- [Issues](https://github.com/RGXMods/FortniteLevelUp/issues)
- [Author: DonnieDice](https://github.com/donniedice)
- [Support development](https://www.buymeacoffee.com/donniedice)

This repository is retained for existing users and historical context. Issue reports and contributions should account for the deprecation notice and the migration path above.

***

## <span style="color: #4ecdc4;">🌟 Thank you for choosing </span> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods! 🌟</span>
