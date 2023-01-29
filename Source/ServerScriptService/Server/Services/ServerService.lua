local RS = game:GetService("ReplicatedStorage")
local Knit = require(RS:WaitForChild("Packages"):WaitForChild("Knit"))

assert(Knit, "Knit is not found.")
type GetPlayers = () -> table

local ServerService = Knit.CreateService {
    Name = "ServerService";
    Client = {};
}

function ServerService:KnitInit()
    self.PlayersList = {}
end

function ServerService:KnitStart()
    Knit.PlayerAdded:Connect(function(Player)
        self.PlayersList[Player.Name] = Player

    end)
    Knit.PlayerRemoving:Connect(function(Player)
        self.PlayersList[Player.Name] = nil
        
    end)
end

function ServerService:GetPlayers()
    return self.PlayersList
end

function ServerService.Client:GetPlayers()
    return ServerService:GetPlayers()
end

return ServerService