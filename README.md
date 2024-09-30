# Initial Configuration Script for Rails Development

This README explains the `initial_config.sh` script, which sets up a new machine for Ruby on Rails development and customizes the terminal.

## Script Overview

The script performs the following main tasks:

1. Updates the system
2. Installs ASDF (version manager)
3. Configures Ruby environment
4. Installs Rails
5. Customizes the terminal with Starship

## Detailed Steps

### 1. System Update
```bash
sudo apt-get update
sudo apt-get upgrade
```

### 2. ASDF Installation

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
```

This installs ASDF version 0.14.1, a versatile version manager for multiple languages.

The script then adds ASDF configuration to `~/.bashrc`:

```bash
echo '' >> ~/.bashrc
echo '# Configuração do asdf' >> ~/.bashrc
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
```

### 3. Ruby Environment Setup

```bash
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
```

This adds the Ruby plugin to ASDF.

The script then installs necessary dependencies for Ruby:

```bash
sudo apt-get install autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
```

After that, it installs Ruby 3.3.5:

```bash
asdf install ruby 3.3.5
asdf global ruby 3.3.5
```

### 4. Rails Installation

```bash
gem install rails
```

This command installs the latest version of Rails.

### 5. Terminal Customization with Starship

```bash
curl -sS https://starship.rs/install.sh | sh
```

This installs Starship, a customizable prompt for any shell.

The script then adds Starship configuration to `~/.bashrc`:

```bash
echo '' >> ~/.bashrc
echo '# Configuração starship' >> ~/.bashrc
echo 'eval "$(starship init bash)"' >> ~/.bashrc
```

Finally, it sets up a preset configuration for Starship:

```bash
starship preset nerd-font-symbols -o ~/.config/starship.toml
```

## Usage

To use this script:

1. Save it as `initial_config.sh`
2. Make it executable: `chmod +x initial_config.sh`
3. Run it: `./initial_config.sh`

Note: You may need to restart your terminal or run `source ~/.bashrc` after the script completes to apply all changes.

## Requirements

- A Debian-based Linux distribution (e.g., Ubuntu)
- Git
- Internet connection

## Customization

Feel free to modify the Ruby version or add more tools as needed for your development environment.


