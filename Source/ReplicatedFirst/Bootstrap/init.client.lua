local RS = game:GetService("ReplicatedStorage")
local Knit = require(RS:WaitForChild("Packages"):WaitForChild("Knit"))

assert(Knit, "Knit is not found.")
type GetCharacter = () -> Instance
type GetHumanoid = () -> Instance

Knit.LocalPlayer = game:GetService("Players").LocalPlayer
Knit.UserInputService = game:GetService("UserInputService")
Knit.RunService = game:GetService("RunService")
Knit.ReplicatedStorage = game:GetService("ReplicatedStorage")
Knit.ReplicatedFirst = game:GetService("ReplicatedFirst")
Knit.TweenService = game:GetService("TweenService")
Knit.StarterGui = game:GetService("StarterGui")
Knit.PlayerGui = Knit.LocalPlayer:WaitForChild("PlayerGui")
Knit.Camera = workspace.CurrentCamera
Knit.Mouse = Knit.LocalPlayer:GetMouse()
Knit.SoundService = game:GetService("SoundService")

function Knit.GetCharacter()
	return Knit.LocalPlayer.Character or Knit.LocalPlayer.CharacterAdded:Wait()
end

function Knit.GetHumanoid()
	return Knit.GetCharacter():WaitForChild("Humanoid")
end

Knit.AddControllers(script:WaitForChild("Controllers"))

Knit.Start():andThen(function()
end):catch(function(err)
	warn(err)
end)