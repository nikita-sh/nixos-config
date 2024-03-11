{ ... }:
{
  programs.waybar.settings.mainBar = {
    layer = "top";
    position = "top";
    height = 24;

    modules-left = [
      "disk"
      "temperature"
      # "custom/ram"
      "memory"
      # "custom/cputemp"
      "cpu"
      # "custom/gputemp"
      "custom/spotify"
    ];
    modules-center = [ "hyprland/workspaces" ];
    modules-right =  [
      "pulseaudio"
      "custom/weather"
      "bluetooth"
      "network"
      "hyprland/language"
      "clock#time"
      "tray"
    ];

    "custom/cputemp" = {
	    exec = "$HOME/.local/bin/binaries/cpu-temp";
	    on-click-release = "bash $HOME/dev/nixos-config/modules/home/waybar/scripts/cpu.sh";
      format = "<span foreground='#d79921'>  </span>{}°C";
	    tooltip = false;
    };

    "custom/gputemp" = {
	    exec = "$HOME/.local/bin/binaries/gpu-temp";
	    on-click-release = "bash $HOME/dev/nixos-config/modules/home/waybar/scripts/gpu.sh";
	    format = "<span foreground='#d79921'>  </span>{}°C"; # The monitor glyph was selected because the GPU glyph is not rendered correctly. At least for me
	    tooltip = false;
    };

    "custom/spotify" = {
      exec = "$HOME/dev/nixos-config/modules/home/waybar/scripts/spotify.py --player spotify";
	    format = "<span size='10000' foreground='#98971a'> </span>{}";
      return-type = "json";
      on-click = "playerctl -p spotify play-pause";
      on-scroll-up = "playerctl -p spotify next";
      on-scroll-down = "playerctl -p spotify previous";
	    tooltip = false;
    };

    "hyprland/language" = {
      format = "<span size='9000' foreground='#d79921'>  </span>{}";
	    format-en = "ENG";
	    format-ru = "another lang";
	    tooltip = false;
	    on-click-release = "hyprctl switchxkblayout sonix-usb-device next"; # replace sonix-usb-device to yours keyboard. Use `hyprctl devices`
    };

    disk = {
	    interval = 60;
	    format = "<span foreground='#d79921'>   </span>{used}";
	    tooltip = false;
    };

    "custom/ram" = {
      exec = "$HOME/dev/nixos-config/modules/home/waybar/scripts/ram";
      format = "<span foreground='#d79921'>   </span>{} MB";
      tooltip = false;
    };

    "hyprland/workspaces" = {
      format = "{icon}";
      on-click-release = "activate";
      sort-by-numbers = false;
	    on-scroll-up = "hyprctl dispatch workspace e+1";
      on-scroll-down = "hyprctl dispatch workspace e-1";
      format-icons = {
	  	  "1" = "I";
	  	  "2" = "II";
	  	  "3" = "III";
	  	  "4" = "IV";
	  	  "5" = "V";
	  	  "6" = "VI";
	  	  "7" = "VII";
	  	  "8" = "VIII";
	  	  "9" = "IX";
	  	  "10" = "X";
      };
    };

    tray = {
      icon-size = 14;
      spacing = 10;
	    show-passive-items = true;
    };

    "clock#time" = {
      interval = 1;
      format = "<span foreground='#d79921' size='10000'> </span>{:%I:%M %p} ";
      tooltip = false;
	    on-click-release = "bash $HOME/dev/nixos-config/modules/home/waybar/scripts/date.sh";
    };

    network = {
	    interval = 1;
	    tooltip = false;
	    format-wifi = "<span foreground='#d79921'>{icon}  </span>Connected<span foreground='#d79921'>      </span>{bandwidthUpBytes}<span foreground='#d79921'>     </span>{bandwidthDownBytes} ";
      format-disconnected = "";
	    format-ethernet = "<span foreground='#d79921'>   </span>Wired  <span foreground='#d79921'>   </span>{bandwidthUpBytes}  <span foreground='#d79921'>   </span>{bandwidthDownBytes}";
	    on-click-right-release = "alacritty --class nmtui -T 'Network Settings' -e nmtui";
	    on-click-release = "$HOME/dev/nixos-config/modules/home/waybar/scripts/net.sh";
	    format-icons = [
	    	"󰤯 "
	    	"󰤟 "
	    	"󰤢 "
	    	"󰤥 "
	    	"󰤨 "
	    ];
    }; 

    bluetooth = {
	    format = "";
	    tooltip = false;
	    format-disabled = "";
	    format-connected = "<span foreground='#d79921' size='10000'> </span>{device_alias}";
	    on-click-release = "blueman-manager";
    };

    "custom/weather" = {
      format = "{}";
      tooltip = true;
      interval = 3600;
      exec = "$HOME/dev/nixos-config/modules/home/waybar/scripts/weather.py";
      return-type = "json";
    };

    pulseaudio= {
        format= "{icon} {volume}%";
        format-muted= "󰖁 ";
        format-icons= {
            default= [" "];
        };
        scroll-step= 5;
        on-click= "pamixer -t";
    };
     memory= {
        format= "󰟜 {}%";
        format-alt= "󰟜 {used} GiB"; # 
        interval= 2;
    };
    cpu= {
        format= "  {usage}%";
        format-alt= "  {avg_frequency} GHz";
        interval= 2;
    };
  };
}
