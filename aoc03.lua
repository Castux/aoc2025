local function checkJoltage1(str)
	local max = 0
	for i = 1, #str do
		for j = i + 1, #str do
			local combined = tonumber(str:sub(i, i) .. str:sub(j, j))
			max = math.max(max, combined)
		end
	end
	return max
end

local function checkJoltage2(str)
	local digits = {}
	local indices = {}

	for k = 1, 12 do
		local firstIndex = (indices[k - 1] or 0) + 1
		for i = firstIndex, #str - (12 - k) do
			local d = tonumber(str:sub(i, i))
			if not digits[k] or d > digits[k] then
				digits[k] = d
				indices[k] = i
			end
		end
	end

	return tonumber(table.concat(digits))
end

local sum1, sum2 = 0, 0
for line in io.lines("aoc03.txt") do
	line = line:match("%d+")
	sum1 = sum1 + checkJoltage1(line)
	sum2 = sum2 + checkJoltage2(line)
end

print(sum1, sum2)
