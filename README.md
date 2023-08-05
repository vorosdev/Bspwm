<div align="center">
  <h1>My configuration for bspwm </h1>
  
---
  <a href="https://github.com/baskerville/bspwm">
    <img src="https://img.shields.io/badge/bspwm-informational.svg?style=for-the-badge&logo=c&color=b4befe&logoColor=cdd6f4&labelColor=1e1e2e" />
  </a>
  <a href="#Bspwm">
    <img src="https://img.shields.io/github/repo-size/vorosdev/Bspwm?style=for-the-badge&logo=gitbook&color=f2cdcd&logoColor=cdd6f4&labelColor=1e1e2e" />
  </a>
  <a href="https://github.com/vorosdev/Bspwm/stargazers">
    <img src="https://img.shields.io/github/stars/vorosdev/qtile?style=for-the-badge&logo=starship&color=94e2d5&logoColor=cdd6f4&labelColor=1e1e2e" />
  </a>
</div>

<div align="center">
  <img src="https://github.com/vorosdev/Bspwm/assets/95487675/95588610-9898-455c-bbfa-0635a220daff" />
</div>

---

| Programs   | Using             |
| ---------- | ----------------- |
| WM         | bspwm             |
| Bar        | polybar           |
| OS         | arch linux        |
| Terminal   | kitty             |
| Shell      | zsh               |
| Editor     | neovim / vscode   |
| Compositor | picom             |
| Launcher   | rofi              |
| FileManager| thunar            |

---
#### Installation:
##### Manual:
```
git clone https://github.com/vorosdev/Bspwm.git
cd Bspwm
yay -Syu --needed --nocleanmenu --nodiffmenu --noeditmenu --removemake --noconfirm - < pkgs.txt
mv ./.config ~/.config
mv ./.zshrc ~/
mv ./Pictures ~/
mv ./fonts/* /usr/share/fonts/
```
##### Automated:
```
coming soon
```
