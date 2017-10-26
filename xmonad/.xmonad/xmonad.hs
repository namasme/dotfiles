import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)
import System.IO


main = do
    xmproc <- spawnPipe "xmobar ~/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "grey" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
	, terminal = "urxvtc"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -activate")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s ~/Pictures/screenshots/%Y-%m-%d_%T.png")
        , ((0, xK_Print), spawn "scrot ~/Pictures/screenshots/%Y-%m-%d_%T.png")
	, ((mod4Mask, xK_p), spawn "dmenu_run -fn 'Droid Sans Mono-9'")
        ] `additionalKeysP`
        [ ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
        , ("<XF86AudioMute>"       , spawn "amixer set Master toggle")
        ]
