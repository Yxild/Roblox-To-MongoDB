--[[

Basic MongoDB API Wrapper

Created Using: https://www.mongodb.com/

DataAPI: https://www.mongodb.com/docs/atlas/api/data-api/

]]


local MongoDataAPI = {}

local Http = game:GetService("HttpService")

function MongoDataAPI:Connect(Key, EndPoint, Cluster, Database, Collection)
	if EndPoint:find('https://') then
		self.MongoKey = Key or nil
		self.MongoEndPoint = EndPoint or nil
		self.MongoCluster = Cluster or nil
		self.MongoDatabase = Database or nil
		self.MongoCollection = Collection or nil
	else
		warn("URL Not Found")
	end
end


function MongoDataAPI:InsertOne(Document)
	if not Document then return nil end
	
	local Data1 = {
		["dataSource"] = self.MongoCluster,
		["database"] = self.MongoDatabase,
		["collection"] = self.MongoCollection,
		["document"] = Document
	}
	
	Data1 = Http:JSONEncode(Data1)
	
	local Success, errorMessage = pcall(function()
		return Http:PostAsync(self.MongoEndPoint.."/action/insertOne", Data1, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.MongoKey})
	end)
	
	--// Error Stuff (Dont Mind Ong)
	if not Success then 
		warn("Error: "..errorMessage)
	end
end

function MongoDataAPI:DeleteOne(filter)
	if not filter then return nil end
	
	local Data2 = {
		["dataSource"] = self.MongoCluster,
		["database"] = self.MongoDatabase,
		["collection"] = self.MongoCollection,
		["filter"] = filter
	}
	
	Data2 = Http:JSONEncode(Data2)
	
	local Success, errorMessage = pcall(function()
		return Http:PostAsync(self.MongoEndPoint.."/action/deleteOne", Data2, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.MongoKey})
	end)
	
	if not Success then
		warn("Error: "..errorMessage)
	end
end

function MongoDataAPI:FindOne(filter) --// Not Tested
	if not filter then return nil end
	
	local Data3 = {
		["dataSource"] = self.MongoCluster,
		["database"] = self.MongoDatabase,
		["collection"] = self.MongoCollection,
		["filter"] = filter
	}
	
	Data3 = Http:JSONEncode(Data3)
	
	local Success, errorMessage = pcall(function()
		return Http:PostAsync(self.MongoEndPoint.."/action/findOne", Data3, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.MongoKey})
	end)
	if not Success then
		warn("Error: "..errorMessage)
	end
end

return MongoDataAPI
