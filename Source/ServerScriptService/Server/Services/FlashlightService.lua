local RS = game:GetService("ReplicatedStorage")
local Knit = require(RS:WaitForChild("Packages"):WaitForChild("Knit"))

local FlashlightService = Knit.CreateService {
	Name = "FlashlightService",
	Client = {},
}

type FlashlightService = typeof(FlashlightService)

function FlashlightService.Client:ToggleFlashlight(Player, Flashlight)

	local isFlashlight = Player.Backpack:FindFirstChild("Flashlight") or Player.Character:FindFirstChild("Flashlight")
	assert(isFlashlight, "Flashlight not found in player's backpack or character")
	
	local LightPart = Flashlight:WaitForChild("LightPart")
	local Light = LightPart:WaitForChild("Light")
	local Beam = LightPart:WaitForChild("Beam")
	if Flashlight:GetAttribute("On") then
		Flashlight:SetAttribute("On", false)
		LightPart.Material = Enum.Material.Glass
		Light.Enabled = false
		Beam.Enabled = false
	else
		Flashlight:SetAttribute("On", true)
		LightPart.Material = Enum.Material.Neon
		Light.Enabled = true
		Beam.Enabled = true
	end
end

FlashlightService.Flashlight = RS:WaitForChild("Flashlight")

FlashlightService.PlayerAdded = Knit.PlayerAdded
FlashlightService.PlayerRemoving = Knit.PlayerRemoving

FlashlightService.PlayerAdded:Connect(function(Player : Player)

	Player.CharacterAdded:Connect(function(Character : Model)
		if Player.Backpack:FindFirstChild("Flashlight") then
			Player.Backpack.Flashlight:Destroy()
		end
		local Flashlight = FlashlightService.Flashlight:Clone()
		Flashlight:SetAttribute("On", true)
		Flashlight.Parent = Player.Backpack
	end)

	Player.CharacterRemoving:Connect(function(Character : Model)
		if Player.Backpack:FindFirstChild("Flashlight") then
			Player.Backpack.Flashlight:Destroy()
		end
	end)

end)

return FlashlightService