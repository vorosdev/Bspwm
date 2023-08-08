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
    <img src="https://img.shields.io/github/stars/vorosdev/Bspwm?style=for-the-badge&logo=starship&color=94e2d5&logoColor=cdd6f4&labelColor=1e1e2e" />
  </a>
</div>

<div align="center">
  <img src="https://github.com/vorosdev/Bspwm/assets/95487675/faef0896-f758-4607-9eb3-9fb41a678271" />
</div>

---

| Programs      | Using             |
| ------------- | ----------------- |
| WM            | bspwm             |
| Bar           | polybar           |
| OS            | arch linux        |
| Terminal      | kitty             |
| Shell         | zsh               |
| Editor        | neovim / vscode   |
| Compositor    | picom             |
| Launcher      | rofi              |
| File Manager  | thunar            |
| Notifications | wired             |

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
sudo mv ./fonts/* /usr/share/fonts/
```
##### Automated:
```
coming soon
```
