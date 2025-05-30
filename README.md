# 飛機射擊遊戲

[English](README_EN.md) | 繁體中文

這是一個使用 Godot 引擎開發的 2D 飛機射擊遊戲。玩家控制一架飛機，躲避敵機並射擊得分。

## 線上演示

您可以直接在瀏覽器中體驗遊戲：
- [遊戲演示](https://gh286991.github.io/Godot-Shmup/)

## 遊戲特色

- 流暢的飛機控制系統
- 動態的敵機生成系統
- 即時分數顯示
- 精美的背景效果
- 碰撞檢測系統

## 遊戲控制

- 方向鍵：控制飛機移動
  - ↑ 向上移動
  - ↓ 向下移動
  - ← 向左移動
  - → 向右移動
- 空白鍵：發射子彈
- 觸控控制（移動設備）：
  - 虛擬搖桿：控制飛機移動
  - 發射按鈕：發射子彈

## 遊戲規則

1. 玩家初始有 3 點生命值
2. 每擊中敵機一次，敵機生命值減少 1 點
3. 敵機生命值歸零時，玩家得分增加
4. 如果玩家被敵機撞到，生命值減少
5. 當玩家生命值歸零時，遊戲結束

## 技術細節

### 主要場景
- `main.tscn`：主遊戲場景
- `start_menu.tscn`：開始選單場景

### 核心腳本
- `main.gd`：主場景控制，處理分數系統
- `player.gd`：玩家控制邏輯
- `enemy.gd`：敵機行為邏輯
- `enemy_spawner.gd`：敵機生成系統
- `bullet.gd`：子彈行為邏輯
- `background.gd`：背景效果控制
- `virtual_joystick.gd`：虛擬搖桿控制系統

## 開發環境

- Godot 4.x
- GDScript

## 如何運行

1. 確保已安裝 Godot 4.x
2. 克隆此專案
3. 使用 Godot 開啟專案
4. 點擊運行按鈕或按 F5 開始遊戲

## 專案結構

```
├── Scenes/              # 場景文件
│   ├── main.tscn       # 主遊戲場景
│   ├── player.tscn     # 玩家場景
│   ├── enemy.tscn      # 敵機場景
│   ├── bullet.tscn     # 子彈場景
│   ├── background.tscn # 背景場景
│   └── start_menu.tscn # 開始選單場景
│
├── script/             # 腳本文件
│   ├── main.gd         # 主場景腳本
│   ├── player.gd       # 玩家控制腳本
│   ├── enemy.gd        # 敵機行為腳本
│   ├── bullet.gd       # 子彈行為腳本
│   ├── background.gd   # 背景效果腳本
│   ├── enemy_spawner.gd # 敵機生成系統
│   ├── virtual_joystick.gd # 虛擬搖桿控制腳本
│   └── start_menu.gd   # 選單控制腳本
│
└── assets/            # 資源文件
    ├── airplane.png   # 飛機圖片
    ├── airplane2.png  # 飛機圖片2
    └── enemy.png      # 敵機圖片
```

## 未來改進

- [ ] 添加音效
- [ ] 實現遊戲暫停功能
- [ ] 添加遊戲結束畫面
- [ ] 實現高分記錄系統
- [ ] 添加不同類型的敵機
- [ ] 實現道具系統
