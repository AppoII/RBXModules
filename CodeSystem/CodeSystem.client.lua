local func = game.ReplicatedStorage.Codes
local answer = script.Parent.Parent.TextBox

script.Parent.MouseButton1Click:Connect(function()
	local result = func:InvokeServer(answer.Text)
	
	script.Parent.Parent.TextBox.Text = result
end)
