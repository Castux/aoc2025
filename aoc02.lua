local input = "8123221734-8123333968,2665-4538,189952-274622,4975-9031,24163352-24202932,1233-1772,9898889349-9899037441,2-15,2147801-2281579,296141-327417,8989846734-8989940664,31172-42921,593312-632035,862987-983007,613600462-613621897,81807088-81833878,13258610-13489867,643517-782886,986483-1022745,113493-167913,10677-16867,372-518,3489007333-3489264175,1858-2534,18547-26982,16-29,247-366,55547-103861,57-74,30-56,1670594-1765773,76-129,134085905-134182567,441436-566415,7539123416-7539252430,668-1146,581563513-581619699"

local function isInvalidPart1(n)
	local str = tostring(n)
	if #str % 2 == 0 then
		local left, right = str:sub(1,#str/2), str:sub(#str/2+1, #str)
		if left == right then
			return true
		end
	end
	return false
end

local function isInvalidPart2(n)
	local str = tostring(n)

	for len = 1,#str/2 do
		if #str % len == 0 then
			local prefix = str:sub(1,len)
			if str == prefix:rep(#str/len) then
				return true
			end
		end
	end
	return false
end

local sum1, sum2 = 0, 0

for r1,r2 in input:gmatch("(%d+)%-(%d+)") do
	r1 = tonumber(r1)
	r2 = tonumber(r2)

	for id = r1,r2 do
		if isInvalidPart1(id) then
			sum1 = sum1 + id
		end
		if isInvalidPart2(id) then
			sum2 = sum2 + id
		end
	end
end

print(sum1, sum2)
