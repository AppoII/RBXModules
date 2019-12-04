local codes = {
	["nice"] = {"money", 100},
	["wicked"] = {"dab", 58885}
}

function codeCheck(player, text)
	local rewards
	
	for i, v in pairs(codes) do
		local rewards = codes[i]
		
		if text == i then
			rewards = codes[i] -- aka v but whatever
			
			if rewards[1] == "money" then
				print("moonay")
				return "You received $" .. rewards[2] .. "!"
			elseif rewards[1] == "dab" then	
				return "You received " .. rewards[2] .. " XP!"
			end
		else
			return "INCORRECT CODE"
		end
	end
end

game.ReplicatedStorage.Codes.OnServerInvoke = codeCheck
