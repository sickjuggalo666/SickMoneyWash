fx_version 'cerulean'
game 'gta5'

name "SickMoneyWash"
description "MoneyWash For ESX, Ox Target, Ox inv and Ox Libs"
author "SickJuggalo666"
version "2.0.0"
lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'shared/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

escrow_ignore {
	'client/*.lua',
	'server/*.lua',
	'shared/*lua'
}