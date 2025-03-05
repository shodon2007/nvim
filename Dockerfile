FROM ubuntu:latest


RUN apt update && apt install -y \
    neovim \
    git \
    curl \
    python3 \
    python3-pip \
    nodejs \
    npm \
    ripgrep \
    fzf \
    && rm -rf /var/lib/apt/lists/*


RUN useradd -m devuser
USER devuser
WORKDIR /home/devuser


RUN git clone --depth=1 https://github.com/shodon2007/nvim.git /home/devuser/.config/nvim
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim /home/devuser/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' || true


CMD ["nvim"]
