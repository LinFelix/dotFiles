import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig
import XMonad.Layout.NoBorders
-- import XMonad.Hooks.EwmhDesktops
-- import XMonad.Hooks.SetWMName

baseConfig = desktopConfig

main = xmonad $ baseConfig
    { layoutHook  = smartBorders $ layoutHook defaultConfig
    , modMask     = mod4Mask
    , terminal    = "xterm -bc -bcf 100 -bcn 100 -bg black -fg orange -cr green"
    -- these two line are for java-gui apps, hower it did not play nicely with gtk3
    -- , startupHook = ewmhDesktopStartup >> setWMName "LG3D"
    -- , startupHook = startupHook desktopConfig >> setWMName "LG3D"
    }
    `additionalKeys`
    [ ((mod4Mask, xK_p), spawn "$(~/.cabal/bin/yeganesh -x)")
    , ((mod4Mask, xK_u), spawn "gnome-terminal")
    , ((mod4Mask, xK_i), spawn "chromium")
    , ((mod4Mask, xK_a), spawn "emacsclient -nc")
    , ((mod4Mask, xK_x), spawn "urxvt")
    , ((mod4Mask, xK_v), spawn "konsole")
    , ((mod4Mask, xK_f), spawn "firefox")
    ]
    `additionalKeysP`
    [ ("<XF86AudioMute>", spawn "pulseaudio-ctl mute")
    , ("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down")
    , ("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up")
    , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
    ]
