module Main where

import GameTypes
import Navigation 
import Frontend
import Graphics.Gloss 
import Graphics.Gloss.Interface.IO.Interact 

main :: IO ()
main = do 
    play FullScreen white 1 hotelLobby (\room -> showRoom room) eventHandler (\_ world -> world)

eventHandler :: Event -> Room -> Room 
eventHandler event room = room 



