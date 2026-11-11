fx_version 'cerulean'
game 'gta5'
author 'Vile'
description 'Maibatsu Mule fleet replacement'
version '1.2.0'
files { 'data/vehicles.meta', 'data/carvariations.meta', 'data/fleet.meta' }
before_level_meta 'data/fleet.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
client_script 'client.lua'
