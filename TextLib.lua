-- Made by overfriended

local module = {}
local ActiveTextLabel
local Counter = 0

function module:setActiveLabel(TextLabel)
	ActiveTextLabel = TextLabel
end

function module:TextLabelOneByOne(text, twait, fwait, callback)
	if ActiveTextLabel == nil or text == nil then
		error("Missing required arguments. (Active text label or text is nil.)")
	else
		if twait == nil then
			twait = 0.5
		end
		
		if typeof(text) == "string" then
			for i = 1, #text, 1 do
				wait(twait)
				Counter = Counter + 1
				ActiveTextLabel.Text = text:sub(1, Counter)
				
				if Counter == #text then
					Counter = 0
					
					if typeof(callback) == "function" and not callback ~= nil then
						local success, err = pcall(callback)
						
						if not success then
							print(err)
						end
					end
				end
			end
		else
			for i, v in pairs(text) do
				repeat wait(twait)
					Counter = Counter + 1
					ActiveTextLabel.Text = text[i]:sub(1, Counter)
				until Counter == #text[i]
				
				if Counter == #text[i] then
					Counter = 0
					if i == #text then
						if not callback == nil then
							if typeof(callback) == "function" then
								local success, err = pcall(callback)
								
								if not success then
									print(err)
								end
							end
						end
					end
				end
			end
		end
	end
end

return module
