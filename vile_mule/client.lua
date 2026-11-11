AddTextEntry('VILE_MULE', 'Mule')
AddTextEntry('VILE_MULE2', 'Mule')
AddTextEntry('VILE_POUNDER', 'Pounder')
local names = {"Cluckin' Bell", "Post OP", "Big Goods", "24/7", "Meteorite", "Dollar Pills", "eCola", "Sprunk", "Logger Beer", "Pisswasser", "Belly-Up Seafood", "Los Santos Fresh Produce", "RON Energy", "Bugstars", "Go Postal", "Humane Labs", "Atomic Tire & Rubber", "Grapeseed Farm Supply", "Binco Clothing", "LTD Gasoline", "Gutter & Blood", "Richards Majestic", "Plain / paint-through"}
local function msg(t) print('[Mule] '..t); TriggerEvent('chat:addMessage',{args={'Mule',t}}) end
local function truck()
 local ped=PlayerPedId(); local v=GetVehiclePedIsIn(ped,false)
 if v==0 or (GetEntityModel(v)~=joaat('mule') and GetEntityModel(v)~=joaat('mule2')) or GetPedInVehicleSeat(v,-1)~=ped then msg('Use the driver seat of mule or mule2.'); return nil end
 return v
end
RegisterCommand('mulelivery',function(_,args)
 local v=truck(); if not v then return end; local n=tonumber(args[1])
 if not n or n~=math.floor(n) or n<1 or n>#names then msg('Use /mulelivery 1 through 23. Plain: 23.'); return end
 if GetVehicleLiveryCount(v)<n then msg(('Livery unavailable: count=%d; definition=%s; mod48=%d.'):format(GetVehicleLiveryCount(v),GetDisplayNameFromVehicleModel(GetEntityModel(v)),GetNumVehicleMods(v,48))); return end
 SetVehicleLivery(v,n-1); msg(('Selected %d: %s'):format(n,names[n]))
end,false)
RegisterCommand('mulecheck',function() local v=truck(); if v then msg(('Version 1.2.0; definition=%s; liveries=%d; current=%d; mod48=%d.'):format(GetDisplayNameFromVehicleModel(GetEntityModel(v)),GetVehicleLiveryCount(v),GetVehicleLivery(v),GetNumVehicleMods(v,48))) end end,false)
