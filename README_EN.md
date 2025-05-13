# Airplane Shooter

English | [繁體中文](readme.md)

This is a 2D airplane shooting game developed with the Godot engine. Players control an airplane, dodge enemy aircraft and score points by shooting.

## Game Features

- Smooth airplane control system
- Dynamic enemy generation system
- Real-time score display
- Beautiful background effects
- Collision detection system

## Game Controls

- Arrow keys: Control airplane movement
  - ↑ Move up
  - ↓ Move down
  - ← Move left
  - → Move right
- Spacebar: Fire bullets

## Game Rules

1. Player starts with 3 health points
2. Each hit reduces enemy health by 1 point
3. Player scores when enemy health reaches zero
4. Player loses health when hit by enemy
5. Game ends when player health reaches zero

## Technical Details

### Main Scenes
- `main.tscn`: Main game scene
- `start_menu.tscn`: Start menu scene

### Core Scripts
- `main.gd`: Main scene control, handles scoring system
- `player.gd`: Player control logic
- `enemy.gd`: Enemy behavior logic
- `enemy_spawner.gd`: Enemy generation system
- `bullet.gd`: Bullet behavior logic
- `background.gd`: Background effects control

## Development Environment

- Godot 4.x
- GDScript

## How to Run

1. Ensure Godot 4.x is installed
2. Clone this project
3. Open the project with Godot
4. Click the run button or press F5 to start the game

## Project Structure

```
├── Scenes/              # Scene files
│   ├── main.tscn       # Main game scene
│   ├── player.tscn     # Player scene
│   ├── enemy.tscn      # Enemy scene
│   ├── bullet.tscn     # Bullet scene
│   ├── background.tscn # Background scene
│   └── start_menu.tscn # Start menu scene
│
├── script/             # Script files
│   ├── main.gd         # Main scene script
│   ├── player.gd       # Player control script
│   ├── enemy.gd        # Enemy behavior script
│   ├── bullet.gd       # Bullet behavior script
│   ├── background.gd   # Background effects script
│   ├── enemy_spawner.gd # Enemy generation system
│   └── start_menu.gd   # Menu control script
```

## Future Improvements

- [ ] Add sound effects
- [ ] Implement game pause feature
- [ ] Add game over screen
- [ ] Implement high score system
- [ ] Add different types of enemies
- [ ] Implement power-up system 