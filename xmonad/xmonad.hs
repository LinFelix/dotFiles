import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig
import XMonad.Layout.NoBorders
-- import XMonad.Hooks.EwmhDesktops
-- import XMonad.Hooks.SetWMName

baseConfig = desktopConfig

main = xmonad $ baseConfig
    -- samrtBorders hide the borders if you use the full screen layout
    { layoutHook  = smartBorders $ layoutHook defaultConfig
    {-- I use the Alt/Meta-key a lot (especially for emacs) and therefore I use
      -  the 'window-key' on the keyboard (which is mod4Mask) --}
    , modMask     = mod4Mask
      -- the xterm is nicely configurable and always available
    , terminal    = "xterm -bc -bcf 100 -bcn 100 -bg black -fg orange -cr green"
    {-- these two line are for java-gui apps (like a couple of famous IDEs),
      -  however it did not play nicely with gtk3 --}
    -- , startupHook = ewmhDesktopStartup >> setWMName "LG3D"
    -- , startupHook = startupHook desktopConfig >> setWMName "LG3D"
    , focusedBorderColor = "#00A0F0"
    , borderWidth = 1
    , normalBorderColor = "#000000"
    }
    `additionalKeys`
    {-- yeganesh is a great backend for dmenu, for example does it sort by
      - frequency of use. You can install it from the AUR, from source or from
      - cabal, i would prefer cabal, since it is less platform dependent. I am
      - using the user installed version, because you don't want to nag your
      - admin abouut it, do you? --}
    [ ((mod4Mask, xK_p), spawn "$(~/.cabal/bin/yeganesh -x)")
    -- a couple usefaul hot-keys (if you use neo2)
    -- , ((mod4Mask, xK_u), spawn "gnome-terminal")
    , ((mod4Mask, xK_i), spawn "chromium")
    -- , ((mod4Mask, xK_a), spawn "emacsclient -nc")
    , ((mod4Mask, xK_x), spawn "urxvt")
    , ((mod4Mask, xK_v), spawn "terminator")
    , ((mod4Mask, xK_f), spawn "firefox")
    ]
    `additionalKeysP`
    {-- forgive me for using pulseaudio(-ctl), in the future i might switch, but
      - for now it works --}
    [ ("<XF86AudioMute>", spawn "pulseaudio-ctl mute")
    , ("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down")
    , ("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up")
    , ("<XF86Explorer>", spawn "playerctl next")
    , ("<XF86LaunchA>", spawn "playerctl pause")
    , ("<XF86Search>", spawn "playerctl previous")
    , ("<XF86MonBrightnessUp>", spawn "light -A 10")
    --, ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10")
    , ("<XF86MonBrightnessDown>", spawn "light -U 10")
    --, ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
    -- toggles the touchpad, the script is from the arch wiki and not mine, that's
    -- why it is not online, maybe I will write my own and put it online
    , ("<XF86Tools>", spawn "sh ~/scripts/system_scripts/touchpad_toggle.sh")
    ]
