# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!
#
# This config file uses keycodes (bindsym) and was written for the QWERTY
# layout.
#
# To get a config file with the same key positions, but for your current
# layout, use the i3-config-wizard

# window gaps
gaps inner 5
gaps outer 5

# fix on floating windows
floating_minimum_size 400 x 300
floating_maximum_size 800 x 600
for_window [window_role="(?i)GtkFileChooserDialog"] floating enable, resize set 640 480, move position center


# bright setting
bindsym XF86MonBrightnessUp exec brightnessctl s +10%
bindsym XF86MonBrightnessDown exec brightnessctl s 10%-


# display wallpaper
exec_always --no-startup-id ~/setwall.sh
exec_always --no-startup-id i3-auto-layout

# start the picom configs
exec --no-startup-id picom --config ~/.config/picom/picom.conf

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:JetBrainsMono Nerd Font 11


# Start XDG autostart .desktop files using dex. See also
# https://wiki.archlinux.org/index.php/XDG_Autostart
exec --no-startup-id dex --autostart --environment i3

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# use these keys for focus, movement, and resize directions when reaching for
# the arrows is not convenient
set $up k      
set $down j    
set $left h    
set $right l    

# use Mouse+Mod1 to drag floating windows to their wanted position
floating_modifier Mod1

# move tiling windows via drag & drop by left-clicking into the title bar,
# or left-clicking anywhere into the window while holding the floating modifier.
tiling_drag modifier titlebar

# start a terminal
bindsym Mod1+Return exec i3-sensible-terminal

# kill focused window
bindsym Mod1+F4 kill

# Cores personalizadas para janelas
client.focused          #88c0d0 #434c5e #eceff4 #88c0d0 #434c5e
client.unfocused        #3b4252 #2e3440 #d8dee9 #3b4252 #2e3440
client.focused_inactive #4c566a #3b4252 #d8dee9 #4c566a #3b4252
client.urgent           #bf616a #3b4252 #eceff4 #bf616a #3b4252


# start dmenu (a program launcher)
bindsym Mod1+d exec --no-startup-id dmenu_run
# A more modern dmenu replacement is rofi:
# bindsym Mod1+d exec "rofi -modi drun,run -show drun"
# There also is i3-dmenu-desktop which only displays applications shipping a
# .desktop file. It is a wrapper around dmenu, so you need that installed.
# bindsym Mod1+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym Mod1+$left focus left
bindsym Mod1+$down focus down
bindsym Mod1+$up focus up
bindsym Mod1+$right focus right

# alternatively, you can use the cursor keys:
bindsym Mod1+Left focus left
bindsym Mod1+Down focus down
bindsym Mod1+Up focus up
bindsym Mod1+Right focus right

# move focused window
bindsym Mod1+Shift+$left move left
bindsym Mod1+Shift+$down move down
bindsym Mod1+Shift+$up move up
bindsym Mod1+Shift+$right move right

# alternatively, you can use the cursor keys:
bindsym Mod1+Shift+Left move left
bindsym Mod1+Shift+Down move down
bindsym Mod1+Shift+Up move up
bindsym Mod1+Shift+Right move right

# split in horizontal orientation
bindsym Mod1+p split h

# split in vertical orientation
bindsym Mod1+o split v

# enter fullscreen mode for the focused container
bindsym Mod1+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym Mod1+s layout stacking
bindsym Mod1+w layout tabbed
bindsym Mod1+e layout toggle split

# toggle tiling / floating
bindsym Mod1+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym Mod1+space focus mode_toggle

# focus the parent container
bindsym Mod1+a focus parent

# focus the child container
#bindsym Mod1+d focus child

# move the currently focused window to the scratchpad
bindsym Mod1+Shift+minus move scratchpad

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
bindsym Mod1+minus scratchpad show

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1: Notebook"
set $ws2 "2: Monitor"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym Mod1+1 workspace number $ws1
bindsym Mod1+2 workspace number $ws2
bindsym Mod1+3 workspace number $ws3
bindsym Mod1+4 workspace number $ws4
bindsym Mod1+5 workspace number $ws5
bindsym Mod1+6 workspace number $ws6
bindsym Mod1+7 workspace number $ws7
bindsym Mod1+8 workspace number $ws8
bindsym Mod1+9 workspace number $ws9
bindsym Mod1+0 workspace number $ws10

# move focused container to workspace
bindsym Mod1+Shift+1 move container to workspace number $ws1
bindsym Mod1+Shift+2 move container to workspace number $ws2
bindsym Mod1+Shift+3 move container to workspace number $ws3
bindsym Mod1+Shift+4 move container to workspace number $ws4
bindsym Mod1+Shift+5 move container to workspace number $ws5
bindsym Mod1+Shift+6 move container to workspace number $ws6
bindsym Mod1+Shift+7 move container to workspace number $ws7
bindsym Mod1+Shift+8 move container to workspace number $ws8
bindsym Mod1+Shift+9 move container to workspace number $ws9
bindsym Mod1+Shift+0 move container to workspace number $ws10

# reload the configuration file
bindsym Mod1+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym Mod1+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym Mod1+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym $left       resize shrink width 10 px or 10 ppt
        bindsym $down       resize grow height 10 px or 10 ppt
        bindsym $up         resize shrink height 10 px or 10 ppt
        bindsym $right      resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left        resize shrink width 10 px or 10 ppt
        bindsym Down        resize grow height 10 px or 10 ppt
        bindsym Up          resize shrink height 10 px or 10 ppt
        bindsym Right       resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or Mod1+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym Mod1+r mode "default"
}

bindsym Mod1+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
    status_command i3status

    # Posição da barra
    position top

    # Tema de cores inspirado no Nord
    colors {
        background #2E3440
        statusline #D8DEE9
        separator  #4C566A

        focused_workspace  #81A1C1 #81A1C1 #2E3440
        active_workspace   #88C0D0 #88C0D0 #2E3440
        inactive_workspace #4C566A #4C566A #2E3440
        urgent_workspace   #BF616A #BF616A #2E3440
    }

    # Espaçamento entre os módulos da barra (padding interno)
    tray_output primary
    font pango:monospace 10

    # Espaçamento entre blocos no i3bar (via separator_symbol ou padding)
    separator_symbol "  "  # Dois espaços para mais espaçamento
}
#######################################################################
# automatically start i3-config-wizard to offer the user to create a
# keysym-based config which used their favorite modifier (alt or windows)
#
# i3-config-wizard will not launch if there already is a config file
# in ~/.config/i3/config (or $XDG_CONFIG_HOME/i3/config if set) or
# ~/.i3/config.
#
# Please remove the following exec line:
#######################################################################
exec i3-config-wizard


# Shortcut for Lockscreen
bindsym Mod1+x exec /home/$USER/.config/scripts/lock

# import xfce settings
exec --no-startup-id xfsettingsd
