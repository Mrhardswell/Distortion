local RS = game:GetService("ReplicatedStorage")
local Knit = require(RS:WaitForChild("Packages"):WaitForChild("Knit"))
local smartBone = require(RS:WaitForChild("Packages"):WaitForChild("SmartBone"))

assert(Knit and smartBone, "Knit or SmartBone is not found.")

local SmartBone = Knit.CreateController {
	Name = "SmartBone";
}

function SmartBone:KnitInit()
	self.SmartBone = smartBone
end

function SmartBone:KnitStart()
	self.SmartBone:Start()
end

return SmartBone