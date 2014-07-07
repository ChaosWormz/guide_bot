minetest.register_on_chat_message(function(name, message)
	local privs = minetest.get_player_privs(name)
	if privs.bot then
		if message == "~protect" then
			minetest.chat_send_all("<BOT> To protect your area: dig down in one corner and type: '/area_pos1'. Then stack high in the opposite corner and type: '/area_pos2'")
			minetest.chat_send_all("<BOT> Once you have set the area positions, type: '/protect (your area's name)' without quotes or parentheses. If this is too hard, ask a moderator or admin for help.")
		end

		if message == "~respect" then
			minetest.chat_send_all("<BOT> Respect other players. Threats of any kind are unwelcome. Discrimination is not tolerated. Be polite.")
		end

		if message == "~skins" then
			minetest.chat_send_all("<BOT> To get a custom skin you will need to provide a link to it and give it to an Admin, don't ask an Admin to pick a skin for you. Your Skin will be enabled after a server restart")
		end

		if message == "~dating" then
			minetest.chat_send_all("<BOT> This server isn't a dating website, most of the players are kids.")
		end

		if message == "~minning" or message == "~interact" then
			minetest.chat_send_all("<BOT> In order to be able to play you will first need to read the rules and then ask a member of staff to give you interact.")
		end

		if message == "~English" or message == "~english" then
			minetest.chat_send_all("<BOT> The majority of users on this server speak English. So that we can all communicate, please speak in English")
		end
	
		if message == "~languge" then
			minetest.chat_send_all("<BOT> This is a family-friendly server: that means no swearing or profanity.")
		end
	
		if message == "~extraprivs" then
			minetest.chat_send_all("<BOT> Please don't ask for privileges like fly or no-clip or admin access. you won't get them.")
		end
			return
	end
	
	if not privs.bot then
	minetest.chat_send_player(name, "<BOT> You're are  not authrized to preform this command", true)
		return
	end

end)

--register priv

minetest.register_privilege("bot", {
	description = "use the shadowbot like bot.",
	give_to_singleplayer= false,
})

