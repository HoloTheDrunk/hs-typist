module Main (main) where

import Brick (Widget, defaultMain, simpleMain, (<=>), (<+>), str, withBorderStyle, joinBorders)
import qualified Brick.Main as BM
import Brick.Widgets.Center (center)
import Brick.Widgets.Border (borderWithLabel, hBorder, vBorder)
import Brick.Widgets.Border.Style (unicode)

data State =
    State { text :: String }
    deriving (Show)

ui :: State -> Widget ()
ui state =
    joinBorders $
    withBorderStyle unicode $
    borderWithLabel (str (text state)) $
    (center 
        (center 
            (str "Left")
            <=> hBorder
            <=> center (str "Bottom Left")
        ) 
        <+> vBorder 
        <+> center (
            str "Right"
        )
    )

main :: IO ()
main = do
    {- let app = BM.App {
        BM.appDraw = \s -> ui s
    }
        initialState = State { text = "Default Text" }

    finalState <- defaultMain app initialState

    putStrLn finalState -}

    let initialState = State { text = "Default Text" } in simpleMain (ui initialState)
