import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)
import System.IO


main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ ewmh defaultConfig
        { manageHook = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
        , layoutHook = noBorders $ avoidStruts $ smartSpacing 5 $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "grey" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
	, terminal = "st"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -activate")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s ~/Pictures/screenshots/%Y-%m-%d_%T.png")
        , ((0, xK_Print), spawn "scrot ~/Pictures/screenshots/%Y-%m-%d_%T.png")
	, ((mod4Mask, xK_p), spawn "rofi -show run -location 1 -lines 3 -width 100")
        , ((mod4Mask, xK_s), spawn "rofi -show windowcd")
        ] `additionalKeysP`
        [ ("<XF86AudioRaiseVolume>", spawn "volume --up")
        , ("<XF86AudioLowerVolume>", spawn "volume --down")
        , ("<XF86AudioMute>"       , spawn "volume --toggle-mute")
        ]
