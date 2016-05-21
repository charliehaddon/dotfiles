import XMonad
import XMonad.StackSet as W
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Fullscreen
import XMonad.Hooks.ManageHelpers

import System.Exit
import qualified Data.Map as M

-- Add new options by editing main, change existing ones below.
main =
  xmonad $ defaultConfig
    { terminal           = myTerminal
    , focusFollowsMouse  = myFocusFollowsMouse
    , borderWidth        = myBorderWidth
    , modMask            = myModMask
    , XMonad.workspaces  = myWorkspaces
    , normalBorderColor  = myNormalBorderColour
    , focusedBorderColor = myFocusedBorderColour
   
    , keys               = myKeys
    --, mouseBindings      = myMouseBindings
      
    , layoutHook         = myLayoutHook
    , manageHook         = myManageHook
    , handleEventHook    = myEventHook
    --, logHook            = myLogHook
    {-, startupHook        = myStartupHook -}}

-- Change things here. Pretty self explanatory.
myTerminal            = "st"
myFocusFollowsMouse   = False
myBorderWidth         = 3
myModMask             = mod1Mask -- mod1Mask = lAlt (mod4Mask = Super)
myWorkspaces          = ["1","2","3","4","5","6","7","8","9"]
myNormalBorderColour  = "#2d2d2d"
myFocusedBorderColour = "#d64937"

-- This key config overrides all pre-existing bindings 
myKeys conf@XConfig {XMonad.modMask = modMask} = M.fromList $
  [ ((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
  , ((modMask,               xK_d     ), spawn "rofi -show run")
  , ((modMask .|. shiftMask, xK_q     ), kill)

  , ((modMask,               xK_k     ), windows W.focusUp)
  , ((modMask,               xK_j     ), windows W.focusDown)
  , ((modMask,               xK_m     ), windows W.focusMaster)

  , ((modMask,               xK_Return), windows W.swapMaster)
  , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp)
  , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown)

  , ((modMask,               xK_l     ), sendMessage Expand)
  , ((modMask,               xK_h     ), sendMessage Shrink)

  , ((modMask,               xK_t     ), withFocused $ windows . W.sink)

  , ((modMask,               xK_period), sendMessage (IncMasterN 1))
  , ((modMask,               xK_comma ), sendMessage (IncMasterN (-1)))
  , ((modMask,               xK_b     ), sendMessage ToggleStruts)

  , ((modMask .|. shiftMask, xK_e     ), io exitSuccess)
  , ((modMask .|. shiftMask, xK_r     ), spawn resetCommand) ] ++
  -- Workspace switching. Mod + [1..9] = switch to workspace
  --                      Mod + shift + [1..9] = move window to workspace
  [ ((modMask .|. m, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)] ]
  where resetCommand = "if type xmonad; then xmonad --recompile && " ++
                       "xmonad --restart; else xmessage xmonad not found"

myManageHook = manageDocks
  <+> fullscreenManageHook
  <+> (isFullscreen --> doFullFloat)
myLayoutHook = fullscreenFull $ avoidStruts tall
  where tall = Tall 1 (3/100) (1/2)
myEventHook  = docksEventHook <+> fullscreenEventHook
