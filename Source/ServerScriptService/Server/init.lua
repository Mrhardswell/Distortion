local RS = game:GetService("ReplicatedStorage")
local Knit = require(RS.Packages:WaitForChild("Knit"))

Knit.PlayersCachedData = {}

Knit.Players = game:GetService("Players")
Knit.PlayerAdded = Knit.Players.PlayerAdded
Knit.PlayerRemoving = Knit.Players.PlayerRemoving

Knit.ServerStorage = game:GetService("ServerStorage")
Knit.ReplicatedStorage = game:GetService("ReplicatedStorage")
Knit.CollectionService = game:GetService("CollectionService")
Knit.DataStoreService = game:GetService("DataStoreService")
Knit.DataStore = Knit.DataStoreService:GetDataStore("TestDataStore")

assert(Knit, "Knit is not found.")
Knit.AddServices(script:WaitForChild("Services"))

Knit.Start():andThen(function()
end):catch(function(Err)
	print("Knit failed to start", Err)
end)