Config = {}

Config.DoorUseItem = true -- false for pin number
Config.LaundryPin = 6669
Config.UseEntrance = true -- set to false if you dont want to use the TP door to money wash
Config.DoorItem = 'keycard' -- set false for no item need
-- GANGS
Config.UseT1gerGangs = true
Config.RemoveNotirietyRep = true
Config.GainNotiriety = 3
Config.RemoveNotiriety = 3

-- ITEMS
Config.RequiredWashItem = 'washcard' -- Set Required Item for Washing. set 'false' for no item requirement
Config.RequiredCuttingItem = 'scissors' -- Set Required Item for Cutting money. set 'false' for no item requirement
Config.RequiredPackagingItem = 'plastic_wrap' -- Set Required Item for Packaging Money. set 'false' for no item requirement

Config.Blip = {
    [1] = {
        enabled = false,
	    coords = vector3(244.5052, 374.24737, 105.73813),
        BlipSpirte = 605,
        BlipColor = 4,
        BlipSize = 0.7,
        BlipLabel = "Laundry",
    }
}

Config.tax = {
    Percentage = 0.9,
}

Config.TargetLocs = {
    ["Enter"] = {
        coords = vector3(244.5396, 374.3640, 105.7381),
    },
    ["Exit"] = {
        coords = vector3(1138.0, -3198.96, -39.67),
    },
    ["cuttingZone"] = {
        coords = vector3(1122.2744, -3197.8213, -40.3933),
    },
    ["packageZone"] = {
        coords = vector3(1120.12, -3197.88, -40.92),
    },
    ["washingZone"] = {
        coords = vector3(1122.3478, -3193.7756, -40.3620),
    },
    ["powerBox"] = {
        coords = vector3(1115.3292, -3193.651, -40.99671),
    }
}

Config.MoneyWash = {
	["Enter"] = {
        coords = vector4(244.5396, 374.3640, 105.7381, 337.4070),
    },
	["Exit"] = {
        coords = vector4(1138.0, -3198.96, -39.67, 11.64),
    }
}

Config.Laundry = {
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
