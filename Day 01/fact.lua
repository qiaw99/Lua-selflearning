#!/usr/local/bin/lua

function fac(n)
	-- body
	if(n == 0) then
		return 1
	else
		return n * fac(n - 1)
	end
end

print(fac(3))
