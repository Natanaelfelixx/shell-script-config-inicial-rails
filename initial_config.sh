sudo apt-get update
sudo apt-get upgrade

#instalçao do asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1

# Adicionar linhas ao final do arquivo ~/.bashrc
echo '' >> ~/.bashrc
echo '# Configuração do asdf' >> ~/.bashrc
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

#reiniciar o shell
exec $SHELL

#adicionando o plugin do ruby e instalando
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git

#instalando dependencias e o ruby
sudo apt-get install autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
asdf install ruby 3.3.5

#setando a versão do ruby e baixando o rails
asdf global ruby 3.3.5
gem install rails

#configurando o terminal com starship
curl -sS https://starship.rs/install.sh | sh
echo '' >> ~/.bashrc
echo '# Configuração starship' >> ~/.bashrc
echo 'eval "$(starship init bash)"' >> ~/.bashrc
starship preset nerd-font-symbols -o ~/.config/starship.toml
