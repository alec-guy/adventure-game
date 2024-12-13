module Frontend where 

import GameTypes 
import Navigation 
import Graphics.Gloss.Data.Picture (Picture (..))
import Graphics.Gloss.Data.Color (Color(..), orange)

showHealth :: Health -> Picture 
showHealth Cookie = 
    Color (orange) (Circle 2.5)
showHealth  Milk   = 
showHealth Cheese = 