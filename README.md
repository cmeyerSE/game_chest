# 🎮 Game Chest

A web application for managing your personal video game collection. Create an account, track games you own, build a wishlist, and log titles you've completed — all in one place.

## ✨ Features

- User account creation and authentication
- Add games to your personal collection
- Categorize games by status:
  - ✅ **Owned** — games in your library
  - ⭐ **Wishlist** — games you want to play
  - 🏆 **Completed** — games you've finished
- Remove games from your collection
- Clean, intuitive interface

## 🛠️ Tech Stack

| Layer     | Technology           |
|-----------|----------------------|
| Language  | Ruby (59%)           |
| Framework | Sinatra (MVC)        |
| Markup    | HTML (28%)           |
| Styling   | CSS (14%)            |
| Database  | SQLite (via ActiveRecord) |

## 📦 Getting Started

```bash
git clone https://github.com/cmeyerSE/game_chest.git
cd game_chest
bundle install
rake db:migrate
shotgun
```

Then open `http://localhost:9393` in your browser.

## 👤 Author

**Cory Meyer** — [GitHub](https://github.com/cmeyerSE) | [Portfolio](https://cmeyerSE.github.io)
