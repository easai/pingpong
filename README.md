# PingPong: A Minimalist Paddle-and-Ball Game

**PingPong** is a fast-paced 2D arcade-style game built in **Godot 4**, where reflexes and precision determine your survival. The player controls a paddle to keep a bouncing ball in play. If the ball drops below the paddle—game over.

---

## Gameplay Overview

- **Objective**: Keep the ball bouncing by catching it with the paddle.
- **Mechanics**:
  - The ball moves and bounces off surfaces.
  - The paddle can be moved horizontally to intercept the ball.
  - Each successful bounce keeps the game going.
  - If the ball falls below the paddle, the game ends.

---

## Core Features

- **Ball physics**: Uses `Vector2.bounce()` for realistic reflection.
- **Signal-based interaction**: Ball emits a `"hit"` signal on collision; paddle responds to keep the ball in play.
- **Game over detection**: Triggered when the ball exits the bottom of the screen.
- **Modular design**: Ball and paddle are separate scenes for easy reuse and extension.

---

## Technologies Used

- **Engine**: Godot 4.x
- **Language**: GDScript
- **Physics**: Built-in 2D physics engine
- **Scene System**: PackedScene instantiation for dynamic gameplay

