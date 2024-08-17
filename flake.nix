{
  description = "Global Packages with Clipboard Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux"; # Adjust this if needed
      pkgs = import nixpkgs {
        system = system; 
        config.allowUnfree = true;
      };
    in
    {
      defaultPackage.${system} = pkgs.buildEnv {
        name = "global-packages";
        paths = with pkgs; [
          go
          wl-clipboard  # Clipboard manager for Wayland
          clipman       # Additional clipboard manager
          ack
          aria2
          bat
          bfg-repo-cleaner
          boost
          broot
          caddy
          cairo
          ctags
          fb303
          fbthrift
          fd
          findutils
          fizz
          folly
          fzf
          fzy
          gettext
          gh
          git-filter-repo
          git-lfs
          git-secret
          glib
          glow
          gnupg
          gnutls
          gobject-introspection
          guile
          harfbuzz
          htop
          httpie
          jq
          krb5
          leptonica
          libass
          libbluray
          librsvg
          libssh2
          lua
          mkcert
          mono
          ncdu
          openssl
          p11-kit
          p7zip
          pandoc
          peco
          perl
          pyenv
          readline
          ripgrep
          todoist
          shellcheck
          sphinx
          starship
          stylua
          tesseract
          tldr
          tmux
          trash-cli
          tree
          unbound
          vapoursynth
          wangle
          tfswitch
          watchman
          libwebp
          wget
          wimlib
          wireguard-tools
          zlib
          xz
          yarn
          zsh-completions
          zsh
          virtualenv
          SDL2
          delta
          gitflow
          terraform
          postgresql
          eza
          go
          asdf-vm
          rename
          ntfs3g
          fastfetch
          fuse
          floorp

          # hyprland
          hyprland
          hyprpaper
          hyprlock
          hypridle
          xdg-desktop-portal-hyprland
          waybar
          grim
          slurp
          cliphist
          wlogout
          nwg-look
          hyprshade
          waypaper
          mission-center
          grimblast
          bun

          # ml4w qtile
          # qtile
          picom
          scrot
          slock
          xorg.xorgserver
          xorg.xinit
          nitrogen
          # python-dbus-next
          # python-iwlib
          xautolock
          qtile-extras

          # ml4w general
          bluez
          bluez-utils
          dunst
          thunar
          nautilus
          mousepad
          noto-fonts
          font-awesome
          fira
          fira-code
          figlet
          vlc
          pavucontrol
          tumbler
          papirus-icon-theme
          breeze-icons
          polkit-gnome
          brightnessctl
          gum
          man-pages
          nm-connection-editor
          gvfs
          xdg-user-dirs
          networkmanager
          network-manager-applet
          xarchiver
          thunar-archive-plugin
          gtk4
          libadwaita
          xdg-desktop-portal
          gnome-calculator
          imagemagick
          guvcview
          jq
          rofi-wayland
          blueman
          xclip
          pinta
          breeze
          qt6ct
          stow
          firefox
          bibata-cursor-theme
          trizen
          smile
          oh-my-posh        

          # IMPORTANT: i need to add aylur's gtk shell in home-manager when i move to nixos

          ];
      };
    };
}
