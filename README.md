## Scripts to generate coding style reports

The script display a colored output on the terminal (inspired by [Abricot-Norminette](https://github.com/Just1truc/Abricot-Norminette)).

### Install
```
wget https://raw.githubusercontent.com/WyeneCloud/BananaSplit-but-for-vim/main/coding-style.sh
mv coding-style.sh ~/.local/bin/coconut
# OR
sudo mv coding-style.sh /usr/bin/coconut
```
You can now use `coconut . .` everywhere !

### Linux

Requirement :

- [Docker](https://docs.docker.com/engine/install/) installed
- [Curl](https://curl.se/download.html) installed

If using Nix, you can run `nix run github:epitech/coding-style-checker` to run a script printing you the list of infractions.

A part of the source code comes from [Epitech](https://github.com/Epitech).

In memoriam of [Abricot-Norminette](https://github.com/Just1truc/Abricot-Norminette).

### Windows

Requirements :

- [Docker](https://docs.docker.com/engine/install/) installed
- [Powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows) installed

Use `coding-style.ps1`

### MacOS

Requirements :

- [Nix](https://github.com/DeterminateSystems/nix-installer) installed

Use `nix run github:epitech/coding-style-checker` to run a script printing you the list of infractions.
(Supports both Intel and Apple Silicon)
