local RS = game:GetService("ReplicatedStorage")
local Knit = require(RS:WaitForChild("Packages"):WaitForChild("Knit"))
assert(Knit, "Knit not found")

local FlashlightController = Knit.CreateController {
	Name = "FlashlightController",
	Server = {}
}

local Character = Knit:GetCharacter()
local Humanoid = Knit:GetHumanoid()
local Camera = Knit.Camera
local Mouse = Knit.Mouse

local Flashlight = Knit.LocalPlayer:WaitForChild("Backpack"):WaitForChild("Flashlight")
assert(Flashlight, "Flashlight not found in player's backpack")

local LightPart = Flashlight:WaitForChild("LightPart")
local Light = LightPart:WaitForChild("Light")
local Beam = LightPart:WaitForChild("Beam")
local Arm = Character:WaitForChild("RightUpperArm",10)
local Shoulder = Arm:WaitForChild("RightShoulder",10)
local HumanoidRootPart = Character.PrimaryPart
local ShoulderOriginC0 = Shoulder.C0

function FlashlightController:KnitStart()
	self.Server.FlashlightService = Knit.GetService("FlashlightService")
	assert(self.Server.FlashlightService, "FlashlightService not found")
end

function EquipFlashlight()
	Flashlight.Parent = Character
	Humanoid:EquipTool(Flashlight)
end

function UnequipFlashlight()
	Humanoid:UnequipTools()
	Shoulder.C0 = ShoulderOriginC0
end

function UpdateArm()
	if Flashlight.Parent == Character then
		if Character:FindFirstChild("UpperTorso") then
			if Shoulder then
				if Camera.CameraSubject:IsDescendantOf(Character) or Camera.CameraSubject:IsDescendantOf(Knit.LocalPlayer) then
					local MouseHit = Mouse.Hit.Position
					local Distance = (HumanoidRootPart.Position - MouseHit).magnitude
					local Difference = HumanoidRootPart.CFrame.Y - MouseHit.Y
					Shoulder.C0 = 
						Shoulder.C0:lerp(ShoulderOriginC0 * CFrame.Angles(-(math.asin(Difference / Distance) ), (((Camera.CFrame.Position - MouseHit).Unit):Cross(Camera.CFrame.LookVector)).Y, 0), .1 )
				end	
			end
		end
	end
	return
end

Knit.RunService.RenderStepped:Connect(UpdateArm)

Knit.UserInputService.InputBegan:Connect(function(Input, Processed)
	if Processed == false then
		if Input.KeyCode == Enum.KeyCode.One then
			if Flashlight.Parent == Character then
				UnequipFlashlight()
			else
				EquipFlashlight()
			end
		elseif Input.KeyCode == Enum.KeyCode.F then
			FlashlightController.Server.FlashlightService:ToggleFlashlight(Flashlight)
		end
	end
end)

Knit.LocalPlayer.CharacterAdded:Connect(function(character)
	Character = character
	Humanoid = Character:WaitForChild("Humanoid")
	HumanoidRootPart = Character.PrimaryPart
	Arm = Character:WaitForChild("RightUpperArm",10)
	Shoulder = Arm:WaitForChild("RightShoulder",10)
	ShoulderOriginC0 = Shoulder.C0
	Flashlight = Knit.LocalPlayer:WaitForChild("Backpack"):WaitForChild("Flashlight")
end)

return FlashlightController