{ ... }:
let custom = {
    font = "FiraCode Nerd Font";
    font_size = "14px";
    font_weight = "bold";
    text_color = "#cdd6f4";
    secondary_accent= "89b4fa";
    tertiary_accent = "f5f5f5";
    background = "11111B";
    opacity = "0.98";
};
in 
{
  programs.waybar.style = ''
* {
  border: none;
  font-family: JetBrains Mono;
  font-weight: bold;
  font-size: 11px;
  min-height: 0;
}

tooltip {
	background: #282828;
	border: 0px solid;
	border-radius: 0px;
}

window#waybar {
  background: #282828;
  color: #ebdbb2;
}

#workspaces button {
  padding: 0 0.6em;
  color: #a89984;
  background: #504945;
  border-radius: 0px;
  margin-right: 4px;
  margin-left: 4px;
  margin-top: 2px;
  margin-bottom: 2px;
}

#workspaces button.active {
  color: #ebdbb2;
  background: #665c54;
}

#workspaces button.urgent {
  color: #1d2021;
  background: #fb4934;
}

#workspaces button:hover {
  background: #665c54;
}

#battery,
#pulseaudio,
#temperature,
#cpu,
#disk,
#date,
#clock,
#network,
#bluetooth,
#workspaces,
#language,
#custom-spotify,
#custom-weather,
#custom-cputemp,
#custom-gputemp,
#custom-ram,
#memory,
#window,
#tray {
  color: #d5c4a1;
  background: #433e3c;
  padding: 0 0.6em;
  margin-right: 4px;
  margin-left: 2px;
  margin-top: 4px;
  margin-bottom: 4px;
  border-radius: 0px;
}

#battery {
  padding: 0 0.6em;
  margin-right: 4px;
}

#tray {
  padding: 0 0.6em;
  margin-right: 4px;
}

#custom-tray-icon {
  margin-left: 0px;
}
  '';
}
