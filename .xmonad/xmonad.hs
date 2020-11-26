import XMonad hiding ( (|||) ) -- appended the hiding
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
-- added
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Layout.DragPane
import XMonad.Layout.Tabbed
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Mosaic
import XMonad.Util.Cursor
-- /
-- for testing
--import XMonad.Layout.Circle
import XMonad.Actions.Commands
import XMonad.Config.Prime (resetLayout, applyIO)
-- /
import System.IO

{-*CONSTANTS*-}
modm = mod1Mask
{-*/CONSTANTS*-}


commands :: X [(String, X ())]
commands = defaultCommands

myStartupHook :: X()
myStartupHook = 
  spawn "compton -CG --active-opacity 1.0 --shadow-ignore-shaped -f -D 2"
  -- spawn "compton --backend glx --xrender-sync --xrender-sync-fence -fcCz -l -17 -t -17"
  <+> setDefaultCursor xC_left_ptr

myLayoutHook = smartSpacing 10 $ gaps [(L, 0), (U, 0), (R, 0), (D, 22)] $ toggleLayouts (noBorders Full) $
    --smartBorders $  mosaic 1.1 [5,3,3,3] |||  Mirror tiled ||| Full -- tabbed shrinkText myTabConfig
    --smartBorders $ Circle ||| Full -- tabbed shrinkText myTabConfig
    smartBorders $  mosaic 1.1 [5,3,3,3] ||| Full -- tabbed shrinkText myTabConfig
      where 
        tiled = Tall nmaster delta ratio
        nmaster = 1
        delta   = 3/100
        ratio   = 3/5

myTabConfig = defaultTheme {
   activeColor         = "#6666cc"
  , activeBorderColor   = "#000000"
  , inactiveColor       = "#666666"
  , inactiveBorderColor = "#000000"
  , decoHeight          = 7
 }

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        --, layoutHook = avoidStruts  $  layoutHook defaultConfig
        , layoutHook = myLayoutHook
        , startupHook = myStartupHook
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 40
                        }
        -- , modMask = mod4Mask     -- Rebind Mod to the Windows key
   , borderWidth = 1
   , normalBorderColor = "black"
   , focusedBorderColor = "orange"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((mod1Mask .|. shiftMask, xK_l), spawn "slock -m \"$(cowsay \"$(fortune)\")\"")
        , ((mod1Mask, xK_p), spawn "dmenu_run -fn 'Ubuntu-9'")
        , ((mod1Mask .|. controlMask, xK_q), spawn "gnome-terminal -x bash -c 'sleep 0.2; vim -p $HOME/.xmonad/xmonad.hs $HOME/.xmobarrc $HOME/.stalonetrayrc'")
        , ((modm .|. controlMask, xK_y), commands >>= runCommand)
        --, ((modm .|. controlMask, xK_space), applyIO $ resetLayout $ smartSpacing 10 $ gaps [(L, 0), (U, 0), (R, 0), (D, 0)] $ toggleLayouts (noBorders Full) $ smartBorders $  mosaic 1.1 [5,3,3,3] ||| Full) 
        ]
