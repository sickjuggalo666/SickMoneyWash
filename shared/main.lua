Config = {}

Config.Blips = true -- set false to disable blips
Config.BlipSpirte = 605
Config.BlipColor = 4
Config.BlipSize = 0.7 
Config.BlipLabel = "Laundry"  --blip name
Config.Blip = {   --blip Locations
	vector3(244.5052, 374.24737, 105.73813),
}

Config = {
    Percentage = 0.9, -- The percentage of money the player gets back after washing. 1.0 is 100% 0.1 is 10%
}



Config.MoneyWash = {
	["Enter"] = { --Entrance of the MoneyWash
        coords = vector4(1138.0, -3198.96, -40.67, 11.64),
    },
	["Exit"] = {  --Exit of the MoneyWash
        coords = vector4(244.5052, 374.24737, 105.73813, 338.35507),
    }
}

Config.Laundry = {  --Dont change anything here
    cuttingZone = {
        coords = vector3(1122.24, -3197.88, -40.4), 
        heading = 179.46,
    },
    packageZone = {
        coord = vector3(1120.12, -3197.88, -39.92), 
        heading = 180.93,
    },
    washingZone = {
    coord = vector3(1122.32, -3194.6, -40.4), 
    heading = 346.76,
	}
}
