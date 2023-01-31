local RS = game:GetService("ReplicatedStorage")
local Knit = require(RS.Packages.Knit)

assert(Knit, "Knit not found. Make sure it is installed into ReplicatedStorage.")

Knit.PlayersCachedData = {}

Knit.Players = game:GetService("Players")

Knit.PlayerAdded = Knit.Players.PlayerAdded
Knit.PlayerRemoving = Knit.Players.PlayerRemoving

Knit.ServerStorage = game:GetService("ServerStorage")
Knit.ReplicatedStorage = game:GetService("ReplicatedStorage")
Knit.CollectionService = game:GetService("CollectionService")
Knit.DataStoreService = game:GetService("DataStoreService")
Knit.RunService = game:GetService("RunService")

Knit.DataStore = Knit.DataStoreService:GetDataStore("TestDataStore")

Knit.AddServices(script.Services)

Knit.Start():andThen(function()
end):catch(warn)