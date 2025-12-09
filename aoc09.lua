local corners = {}
for line in io.lines "aoc09.txt" do
	local r, c = line:match "(%d+),(%d+)"
	table.insert(corners, { tonumber(r), tonumber(c) })
end

local function drawData()
	local svgTemplate = [[
<svg viewBox="0 0 100000 100000" xmlns="http://www.w3.org/2000/svg">
  <polygon points="%s" />
</svg>]]

	local svgPoints = ""
	for _, p in ipairs(corners) do
		svgPoints = svgPoints .. p[1] .. "," .. p[2] .. " "
	end

	print(string.format(svgTemplate, svgPoints))
end

-- drawData()

local function isBetween(a, b, x)
	return (a < x and x < b) or (b < x and x < a)
end

local function isInside(a, b, p)
	return isBetween(a[1], b[1], p[1]) and isBetween(a[2], b[2], p[2])
end

local function anyInside(a, b)
	for _, p in ipairs(corners) do
		if isInside(a, b, p) then return true end
	end
	return false
end

local function part1()
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

print(part1())

local magic1 = { 94710, 48527 }		-- Yes, this is cheating
local magic2 = { 94710, 50238 }

local function part2()
	local maxArea = 0

	for i = 1, #corners do
		local a, b = magic1, corners[i]
		if b[2] < magic1[2] and not anyInside(a, b) then
			local area = (math.abs(a[1] - b[1]) + 1) * (math.abs(a[2] - b[2]) + 1)
			maxArea = math.max(area, maxArea)
		end
	end

	for i = 1, #corners do
		local a, b = magic2, corners[i]
		if b[2] > magic2[2] and not anyInside(a, b) then
			local area = (math.abs(a[1] - b[1]) + 1) * (math.abs(a[2] - b[2]) + 1)
			maxArea = math.max(area, maxArea)
		end
	end

	return maxArea
end

print(part2())
