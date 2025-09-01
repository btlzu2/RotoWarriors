# RotoWarriors
A "from scratch" Playdate version of Ikari Warriors. :)

# Project Architecture and Contribution Guide

This document explains how the game is structured, how to add new features without creating spaghetti, and where to start when adding a tile-based background.

---

## Architecture Overview

- **`main.lua`**  
  The frame loop. Updates timers, updates sprites, and hands control to the current scene. Should stay tiny forever.

- **`src/scene_manager.lua`**  
  A traffic cop. Knows which “mode” we’re in (menu, game, pause) and calls that scene’s `enter()` / `update()`.

- **`src/scenes/`**  
  Each scene is a coherent flow of the game. Example:  
  - `game.lua` → orchestrates gameplay. Creates entities, responds to input at a high level (e.g., “press A → fire”), plays SFX, and transitions to other scenes.

- **`src/entities/`**  
  Actors with behavior. Each entity owns its sprite(s), state, and per-frame logic. Examples:  
  - `player.lua` → d-pad movement; crank snapped to 0/90/180/270; sets the right facing image.  
  - `bullet.lua` → flies in the player’s facing; removes itself offscreen.

- **`assets/images`, `assets/sounds`**  
  Art and audio. Paths are case-sensitive on device; keep them lowercase.  
  - `assets/images/rotowarrior0.png … rotowarrior270.png`  
  - `assets/sounds/pew.wav`

**Frame call chain each frame:**
main.lua  →  SceneManager:update()  →  GameScene:update()
↳ gfx.sprite.update()  →  Player:update(), Bullet:update(), …
---

# Best Practices for Development

This project runs on the Playdate SDK in Lua.  
To keep the codebase clean, scalable, and fun to work on, follow these guidelines when adding features or making changes.

---

## 1. Put Code Where It Belongs

- **Scenes** handle *when* things happen.  
  Example: input → spawn bullets, play sound effects.  
- **Entities** handle *how* actors behave or draw.  
  Example: player movement, bullet flight.  
- **Scene Manager** handles global modes and navigation.  
- **Main** should remain tiny — only bootstraps the loop.

---

## 2. Keep Scenes Skinny, Entities Focused

- Scenes orchestrate high-level game flow.  
- Entities own their state and sprite behavior.  
- If an entity grows too large (e.g., player managing UI + physics), split helpers into modules (e.g., `src/ui/hud.lua`, `src/systems/physics.lua`).

---

## 3. Filenames Lowercase, Imports Exact

Playdate’s filesystem is case-sensitive. Always use lowercase filenames.  

```lua
-- ✅ Correct
import "src/scenes/game"
import "src/entities/player"

-- ❌ Incorrect
import "src/scenes/Game"
import "src/entities/Player"

## 4. Commit Messages

Use [Conventional Commits](https://www.conventionalcommits.org/) to keep history clear.

Examples:
- `feat(player): add dash mechanic`
- `fix(bullet): prevent offscreen crash`
- `chore(assets): add tileset images`
- `docs(readme): update build instructions`

---

## 5. Performance Basics (Playdate-Friendly)

- Avoid creating garbage tables/objects every frame.  
- Load images and sounds once (e.g., in `enter()`), not in `update()`.  
- Use `gfx.sprite.update()` for drawing unless you intentionally draw directly in a background callback.

---

## 6. Constants and Paths in One Place

- Use `src/constants.lua` for speeds, bounds, and cooldowns.  
- Optionally create `src/paths.lua` to centralize asset paths:

```lua
ASSETS = {
  images = "assets/images/",
  sounds = "assets/sounds/"
}

## 7. Small, Descriptive Commits

Add one feature or fix per commit.  
This makes history easy to read, debug, and revert when necessary.

---

## 8. Debugging Checklist

- **Player not visible?**  
  Check z-index (`player:setZIndex(10)`) and confirm `gfx.sprite.update()` is called in `main.lua`.

- **Image not found?**  
  Paths must match exactly (case-sensitive). Confirm filenames are lowercase and match your asset folder.

- **Tile indices wrong?**  
  Imagetables are 1-based. Index 0 draws nothing.

---

## 9. Roadmap for Next Steps

- `feat(scene): add tilemap background`  
- `feat(player): constrain movement to map bounds`  
- `feat(bullet): simple collision against border tiles`  
- `feat(sfx): add step sound or reload sound`  
- `docs(readme): add tileset credits + how to build`

---