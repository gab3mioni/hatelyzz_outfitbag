# hatelyzz_outfitbag

 QBCore script to change outfits wherever you are using illenium-appearance

 # Dependencies
 ---

 - qb-target
 - illenium-appearance (clothing system)

# Item installation

- Go to `[qb] > qb-core > shared > items.lua` and add this line:

```lua
['outfitbag'] 			         = {['name'] = 'outfitbag', 				    ['label'] = 'Outfit Bag', 		['weight'] = 10000, 	["type"] = "item", 		["image"] = 'outfitbag.png', 		    ['unique'] = true, 		['useable'] = true, 	["shouldClose"] = true,	   ["combinable"] = nil, ["created"] = nil,   ['description'] = ''},
```
