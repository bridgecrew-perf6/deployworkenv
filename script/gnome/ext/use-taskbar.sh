#!/bin/bash
dconf load /org/gnome/shell/extensions/dash-to-panel/ <<END
[/]
isolate-monitors=true
isolate-workspaces=true
panel-positions='{"0":"LEFT"}'
panel-sizes='{"0":80}'
dot-position='LEFT'
dot-style-focused='DASHES'
dot-style-unfocused='DOTS'
dot-size=5
trans-use-custom-opacity=true
trans-use-dynamic-opacity=true
appicon-padding=12
appicon-margin=2
middle-click-action='QUIT'
shift-click-action='LAUNCH'
scroll-panel-action='NOTHING'
show-showdesktop-hover=true
window-preview-size=380
click-action='TOGGLE-SHOWPREVIEW'
END

echo ./gnome/ext/use-taskbar.sh >> ~/deployworkenv.log
