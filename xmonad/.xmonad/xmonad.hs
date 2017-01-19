import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName

baseConfig = desktopConfig

main = xmonad $ baseConfig
    { modMask     = mod4Mask
    , terminal    = "uxterm -bc -bcf 100 -bcn 100 -bg black -fg orange -cr green"
    -- , startupHook = ewmhDesktopStartup >> setWMName "LG3D"
    -- , startupHook = startupHook desktopConfig >> setWMName "LG3D"
    }
    `additionalKeysP`
    [ ("<XF86AudioMute>", spawn "pulseaudio-ctl mute")
    , ("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down")
    , ("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up")
    , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
    ]
