module GameTypes where 


data Room = Room
          {description :: String 
          ,items       :: [Item] 
          ,exits       :: [RoomID]
          } deriving (Show, Eq)

type RoomID = String 

data Item = WeaponItem Weapon 
          | HealthItem Health
          | Chest [Item] Key
          | KeyItem Key
          deriving (Show, Eq)

data Key = ChestKey 
         | DoorKey
         | SnackKey
         deriving (Show, Eq)
------------------------------------------------------

data Weapon = SledgeHammer | Dagger deriving (Show, Eq)

data Health = Cookie | Milk | Cheese deriving (Show, Eq)

-----------------------------------------------------
newtype Rooms = Rooms [Room] deriving (Show, Eq)

--------------------------------------------------------------
gameWorld :: Rooms 
gameWorld = Rooms  $ 
          [hotelLobby
          ,snackRoom
          ,elevator
          ,floor1 
          ,floor2
          ,floor3
          ]
---------------------------------------------------------------------
hotelLobby :: Room 
hotelLobby = Room 
           { description = "Hotel Room"
           , items       = [Chest [WeaponItem Dagger] (ChestKey), KeyItem ChestKey]
           , exits       = ["snackRoom","elevator"]
           }
snackRoom :: Room 
snackRoom = Room 
          {description = "Snack Room"
          ,items       = [Chest ([HealthItem Cookie, HealthItem Milk, HealthItem Cheese]) (SnackKey)]
          ,exits       = ["hotelLobby"]
          }
elevator :: Room 
elevator = Room
         {description = "Elevator"
         ,items       = []
         ,exits       = ["floor1", "floor2", "floor3"]
         }
floor1 :: Room 
floor1 = Room 
       {description = "Floor1"
       ,items       = [KeyItem DoorKey]
       ,exits       = ["room101", "elevator"]
       }
floor2 :: Room 
floor2 = Room 
       {description = "Floor1"
       ,items       = [KeyItem DoorKey]
       ,exits       = ["room202", "elevator"]
       }
floor3 :: Room 
floor3 = Room 
       {description = "Floor1"
       ,items       = [KeyItem DoorKey]
       ,exits       = ["room303", "elevator"]
       }
room101 :: Room 
room101 = Room 
        {description = "101"
        ,items = [KeyItem SnackKey]
        ,exits = ["floor1"]
        }
room202 :: Room 
room202 = Room 
        {description = "202"
        ,items = [WeaponItem SledgeHammer]
        ,exits = ["floor2"]
        }

room303 :: Room 
room303 = Room 
        {description = "202"
        ,items = [WeaponItem SledgeHammer]
        ,exits = ["floor3"]
        }
