	sudo apt-get update
sudo apt-get upgrade

# Instalação do asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1

# Adicionar linhas ao final do arquivo ~/.bashrc
echo '' >> ~/.bashrc
echo '# Configuração do asdf' >> ~/.bashrc
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

# Reiniciar o shell
exec $SHELL

# Adicionando o plugin do ruby e instalando
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git

# Instalando dependências e o ruby
sudo apt-get install autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
asdf install ruby 3.3.5

# Setando a versão do ruby e baixando o rails
asdf global ruby 3.3.5
gem install rails

# Configurando o terminal com starship
curl -sS https://starship.rs/install.sh | sh
echo '' >> ~/.bashrc
echo '# Configuração starship' >> ~/.bashrc
echo 'eval "$(starship init bash)"' >> ~/.bashrc
starship preset nerd-font-symbols -o ~/.config/starship.toml

# Instalação do Neovim
sudo apt-get install neovim

# Criando o arquivo de configuração do Neovim
mkdir -p ~/.config/nvim
cat <<EOF > ~/.config/nvim/init.vim
" Vim-Plug Config
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'rhysd/conflict-marker.vim'
call plug#end()
set number

let mapleader=','
nmap <leader>/ :NERDTreeToggle<CR>
nmap <leader>s :w<CR>
nmap <leader>sq :wq<CR>

function! GitCommitPush(msg)
  if a:msg == ''
    echo "Commit message required"
    return
  endif
  let l:branch = system('git rev-parse --abbrev-ref HEAD')
  let l:branch = substitute(l:branch, '\n', '', 'g')
  execute '!git add .'
  execute '!git commit -m "' . a:msg . '"'
  execute '!git push origin ' . l:branch
endfunction

command! -nargs=1 Pushatudo call GitCommitPush(<f-args>)
EOF

# Instalando o vim-plug para plugins
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Script atualizado e completo! 🚀"

