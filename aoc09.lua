local corners = {}
for line in io.lines "aoc09.txt" do
	local r, c = line:match "(%d+),(%d+)"
	table.insert(corners, { tonumber(r), tonumber(c) })
end

local function solve()
	local maxArea = 0
	for i = 1, #corners do
		for j = i + 1, #corners do
			local a, b = corners[i], corners[j]

			local area = (math.abs(a[1] - b[1]) + 1) * (math.abs(a[2] - b[2]) + 1)
			maxArea = math.max(area, maxArea)
		end
	end
	return maxArea
end

print(solve())
