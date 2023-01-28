local RS = game:GetService("ReplicatedStorage")
local Knit = require(RS:WaitForChild("Packages"):WaitForChild("Knit"))

type ClientRootVector3 = {
    X: number;
    Y: number;
    Z: number;
}

local ClientController = Knit.CreateController {
    Name = "ClientController";
    Server = {};
}

function ClientController:KnitInit()
    self.ClientRootVector3 = {
        X = 0;
        Y = 0;
        Z = 0;
    }
end

function ClientController:KnitStart()
    Knit.LocalPlayer.CharacterAdded:Connect(function(Character)
        Character:WaitForChild("HumanoidRootPart").Touched:Connect(function(TouchPart)
            if self.TouchPart == TouchPart then return end
            if TouchPart.Name == "Detection" then
                self.TouchPart = TouchPart
                self.ClientRootVector3 = self:GetCurrentRootVector3()
             warn("Player Touched by Detection")
            end
        end)
        Character:WaitForChild("HumanoidRootPart").TouchEnded:Connect(function(TouchPart)
            if self.TouchPart == TouchPart then
                self.TouchPart = nil
                warn("Player TouchEnded by Detection")
            end
        end)
    end)
end

function ClientController:GetCurrentRootVector3()
    local HumanoidRoot = Knit.GetCharacter():WaitForChild("HumanoidRootPart")
    self.ClientRootVector3 = {
        X = HumanoidRoot.Position.X;
        Y = HumanoidRoot.Position.Y;
        Z = HumanoidRoot.Position.Z;
    }
    return self.ClientRootVector3
end

return ClientController