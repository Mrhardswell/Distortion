local RS = game:GetService("ReplicatedStorage")
local Knit = require(RS.Packages.Knit)

assert(Knit, "Knit not found. Make sure it is installed into ReplicatedStorage.")

Knit.Start():andThen(function()
    print("Knit started!")
end):catch(warn)