module Navigation where 

import GameTypes 


{-


Objective 2. Player interaction 
move between rooms 
pick up and drop items 
view their inventory 

-}
data Player = Player 
            { health       :: Int 
            ,inventory    :: Inventory 
            ,selectedItem :: Maybe Item 
            }
            deriving (Show, Eq)

newtype Inventory = Inventory [Item] deriving (Show, Eq)

player :: Player 
player = Player 
       {health       = 200 
       ,inventory    = Inventory [] 
       ,selectedItem = Nothing 
       }

fromRoomID :: RoomID -> Maybe Room 
fromRoomID roomid = 
    case roomid of 
        "elevator"   -> Just elevator 
        "hotelLobby" -> Just hotelLobby
        "snackRoom"  -> Just snackRoom 
        "floor1"     -> Just floor1 
        "floor2"     -> Just floor2
        "floor3"     -> Just floor3 
        "room101"    -> Just room101 
        "room202"    -> Just room202 
        "room303"    -> Just room303 
        _            -> Nothing 

