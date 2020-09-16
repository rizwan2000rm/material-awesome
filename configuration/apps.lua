local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'alacritty',
    screenshot = '~/.config/awesome/configuration/utils/screenshot -m',
    region_screenshot = '~/.config/awesome/configuration/utils/screenshot -r',
    delayed_screenshot = 'sleep 10 ; ~/.config/awesome/configuration/utils/screenshot -r',
    
    -- Editing these also edits the default program
    -- associated with each tag/workspace
    -- associated with each tag/workspace
    browser = 'firefox',
    editor = 'code', -- gui text editor
    social = 'discord',
    game = rofi_command,
    files = 'dolphin',
    music = 'spotify'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    -- feh
    -- mention directories equal to number of monitors
    'feh --bg-max --randomize ~/.wallpaper/wallpaper/* ~/.wallpaper/wallpaper/*', --random wallpapers from specified directory

    'numlockx on', -- enable numlock
    'ibus-daemon --xim', -- Ibus daemon for keyboard
    'xfce4-power-manager', -- Power manager
    'nm-applet', -- wifi
    'pa-applet', -- shows an audiocontrol applet in systray when installed.
    'flameshot', --screenshot utility
    'redshift-gtk',
    -- 'blueman-applet' -- Bluetooth tray icon
    -- 'blueman-manger'
    --'scream -u -p 4011 -i virbr1', -- scream audio sink

     -- credential manager
    '/usr/lib/polkit-kde-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)',
    -- '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)',
    --KDE '/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    -- MATE'/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager

    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
