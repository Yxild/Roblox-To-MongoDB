# Roblox-To-MongoDB

# Setup

SOON (Im Lazy)

# Get Started

First Require The Module:

```lua
local Module = require(10531220285)
```

Now Lets Connect

```lua
local Module = require(10531220285)

Module:Connect("Key", "UrlEndpoint", "Cluster", "Database", "Collection") --// Data API Access Should Be Read And Write
```

You Are Now Connected To MongoDB

Now Lets Insert An Document

```lua
local Module = require(10531220285)

Module:Connect("Key", "UrlEndpoint", "Cluster", "Database", "Collection") --// Data API Access Should Be Read And Write

Module:InsertOne({ Name: 'Hello' })
```

Now Lets Delete An Document

```lua
local Module = require(10531220285)

Module:Connect("Key", "UrlEndpoint", "Cluster", "Database", "Collection") --// Data API Access Should Be Read And Write

Module:DeleteOne({ Name: 'Hello' })
```

Now Lets Find The Document!

```lua
local Module = require(10531220285)

Module:Connect("Key", "UrlEndpoint", "Cluster", "Database", "Collection") --// Data API Access Should Be Read And Write

Module:FindOne({ Name: 'Hello' })
```

# Important

```lua
More Feature Soon
FindOne Is Not Tested
```
