local RS = game:GetService("ReplicatedStorage")
local Knit = require(RS.Packages.Knit)

assert(Knit, "Knit not found. Make sure it is installed into ReplicatedStorage.")
type GetCharacter = () -> Model
type GetHumanoid = () -> Humanoid

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
Knit.PhysicsService = game:GetService("PhysicsService")

function Knit.GetCharacter()
	return Knit.LocalPlayer.Character or Knit.LocalPlayer.CharacterAdded:Wait()
end

function Knit.GetHumanoid()
	return Knit.GetCharacter():WaitForChild("Humanoid")
end

Knit.AddControllers(script.Controllers)

Knit.Start():andThen(function()
end):catch(warn)