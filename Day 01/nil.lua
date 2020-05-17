#!/usr/local/bin/lua

tab = {key1 = "val1", key2 = "val2", "val3"}
for k,v in pairs(tab) do
	print(k .. "-" .. v)
end

tab.key1 = nil

for k,v in pairs(tab) do
	print(k .. "-" .. v)
end
