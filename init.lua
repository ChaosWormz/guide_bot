minetest.register_privilege("bot", {
	description = "Use the guide bot.",
	give_to_singleplayer= false,
})

minetest.register_chatcommand("gbot", {
	params = "",
	description = "Command the bot to give useful information",
	func = function(player, message)
	local pretext = ""

	local responses = {
		["protect"] = 	{	"To protect your area: dig down in one corner and type: '/area_pos1'. " ..
													"Then stack high in the opposite corner and type: '/area_pos2'",
												"Once you have set the area positions, type: '/protect (your area's name)' without quotes or parentheses. " ..
													"If this is too hard, ask a moderator or admin for help."
		},

		["respect"] = 	{ "Respect other players. Threats of any kind are unwelcome. " ..
												"Discrimination is not tolerated. Be polite."
		},

		["skins"] = 		{ "To get a custom skin you will need to provide a link to it and give it to an Admin. " ..
												"Don't ask an Admin to pick a skin for you. Your skin will be enabled after a server " ..
												"restart"
		},

		["dating"] =		{ "This server is not a dating service. Using it as such will result in a ban." },

		["interact"] = { "In order to play you will first need to read and agree with the rules, " ..
												"and then ask a member of staff to give you interact."
		},

		["english"] =	{ "The majority of players on this server speak English. " ..
												"So that we can all communicate, please speak in English."
		},

		["language"] = { "This is a family-friendly server: that means no swearing or profanity." },

		["extraprivs"] = { "Please don't ask for privileges like fly or no-clip or admin access. " ..
													"You won't get them." },

		["notminecraft"] = { "Minetest isn't Minecraft. Commands like gamemode 1 and op don't work. " ..
													"Even if they did work you would not get them." },

		["themaze"] = { "All new players must complete the maze. The maze is very easy if you have read the rules. Read each" ..
													" sign and choose the door that has the correct answer. " ..
													"Please don't ask to be teleported out of the maze before completion." },

		["spam"] = { "Please don't flood the chat. It very annoying and interferes with important conversations " ..
													"not to mention it irritates everyone." },

--remove or alter following line if your server does't have crafting guide or it works differently
		["craft"] = { "This server has a crafting guide that can be accessed by typing /m in the chat-box." ..
													" It is button number 2." },
	}

	if not minetest.get_player_privs(player).bot then
		minetest.chat_send_player(player, "Insufficient privileges", true)
		return
	end
	
	lines = responses[string.lower(message)]
	if not lines then
		minetest.chat_send_player(player, "Unknown command", true)
		return
	end

	for _, ln in ipairs(lines) do
		local msg = pretext .. ln
		minetest.chat_send_all(msg)
		irc:say(("* %s %s"):format("", msg))
	end
end,})
