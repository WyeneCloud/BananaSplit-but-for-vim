## Scripts to generate coding style reports

The script display a colored output on the terminal (inspired by [Ardorax/BananaSplit](https://github.com/Ardorax/BananaSplit)).

add this to your vim config file
### vim config support
```
set makeprg=coconut\ .\ .
" :make
"  - :cl -> see all errors
"  - :cc# -> jump to error to error
"  - :cn or cp to navigate though error
```

## How it work 
:make
 - :cl -> see all errors
 - :cc# -> jump to error to error
 - :cn or cp to navigate though error

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

## Screenshot
![image](https://github.com/WyeneCloud/coconut-macaroons/assets/56542176/feaa543e-3c67-4522-83c1-bc75d2872fbd)
### :cn 
![image](https://github.com/WyeneCloud/coconut-macaroons/assets/56542176/7dc8143c-7045-44af-988c-8ea01a9edb26)
### :cn
![image](https://github.com/WyeneCloud/coconut-macaroons/assets/56542176/10b353ab-3efa-4843-acf3-abb16fce7b6c)
### cl
![image](https://github.com/WyeneCloud/coconut-macaroons/assets/56542176/bb4b1a3d-4ba9-4a47-b895-4615c37f453a)



