
#!/bin/bash

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim;
sudo npm install -g n;
sudo npm i -g vscode-langservers-extracted;
sudo npm install -g cssmodules-language-server;
sudo npm install -g @tailwindcss/language-server;
sudo npm install -g typescript typescript-language-server;
sudo npm install -g @olrtg/emmet-language-server
sudo npm i -g some-sass-language-server
sudo apt-get install ripgrep
