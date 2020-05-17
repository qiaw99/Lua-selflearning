#!/usr/local/bin/lua

do
	function foo( ... )
		-- body
		for i = 1, select('#', ...) do
			local arg = select(i, ...)
			print("arg", arg)
		end
	end
	foo(1, 2, 3, 4)
end

--[[
-->
arg	1
arg	2
arg	3
arg	4
--]]
