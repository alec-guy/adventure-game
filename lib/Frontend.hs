module Frontend where 

import GameTypes 
import Navigation 
import Graphics.Gloss.Data.Picture 
import Graphics.Gloss.Data.Color 
import Data.Maybe (fromJust)

-----
showHealth :: Health -> Picture 
showHealth Cookie = 
    Color (orange) (Circle 2.5)
showHealth  Milk   = 
    Color (white) (Text "Milk")
showHealth Cheese = 
    Color (yellow) (Text "Cheese")
---
showKey :: Key -> Picture 
showKey ChestKey = 
    Color (yellow) (Text "Chest Key")
showKey DoorKey = 
    Color (orange) (Text "Door Key")
showKey SnackKey = 
    Color (red) (Text "Snack Key")
-----
showWeapon :: Weapon -> Picture 
showWeapon weapon = 
    case weapon of 
        SledgeHammer -> 
            Color (black) (Text "SledgeHammer")
        Dagger -> 
            Color (black) (Text "Dagger")
showItem :: Item -> Picture 
showItem item = 
    case item of 
        (WeaponItem w)     -> showWeapon w 
        (HealthItem h)     -> showHealth h 
        (KeyItem k)        -> showKey k 
        (Chest items _) -> 
            Pictures $ showItem <$> items
showRoom :: Room -> Picture 
showRoom room = 
    Pictures $ 
    [rectangleSolid 10.0 10.0
    ,Text $ description room 
    ,Pictures $ showExit <$> exits room 
    ]

showExit :: RoomID -> Picture 
showExit roomid = 
    Pictures 
    [Color red $ polygon [(10.2,10.2)]
    ,Color white (translate 10.2 10.2 (text roomid))
    ]
showPlayer :: Player -> Picture 
showPlayer player = 
    Pictures 
    [text $ show $ health $ player
    ,text $ show $ inventory $ player 
    ,text $ show $ selectedItem $ player 
    ]


