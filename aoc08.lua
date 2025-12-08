local networks = {}
local points = {}
local index = 1
for line in io.lines "aoc08.txt" do
	local x, y, z = line:match "(%d+),(%d+),(%d+)"
	local p = { x, y, z }
	networks[p] = index
	table.insert(points, p)
	index = index + 1
end

local function merge(a, b)
	local oldNet = networks[b]
	local newNet = networks[a]
	if oldNet == newNet then
		return
	end

	for point, net in pairs(networks) do
		if net == oldNet then
			networks[point] = newNet
		end
	end
end

local function distance(a, b)
	return math.sqrt(
		(b[1] - a[1]) ^ 2 +
		(b[2] - a[2]) ^ 2 +
		(b[3] - a[3]) ^ 2
	)
end

local distances = {}
for i = 1, #points do
	for j = i + 1, #points do
		local a, b = points[i], points[j]
		table.insert(distances, { a, b, distance(a, b) })
	end
end
table.sort(distances, function(a, b) return a[3] < b[3] end)

local function part1()
	for i = 1, 1000 do
		local pair = distances[i]
		local a, b = pair[1], pair[2]
		merge(a, b)
	end

	local netSizes = {}
	for _, net in pairs(networks) do
		netSizes[net] = (netSizes[net] or 0) + 1
	end

	local tmp = {}
	for _, netSize in pairs(netSizes) do
		table.insert(tmp, netSize)
	end
	table.sort(tmp)

	print(tmp[#tmp] * tmp[#tmp - 1] * tmp[#tmp - 2])
end

local function isOneNetwork()
	local _, firstNet = next(networks)
	for _, net in pairs(networks) do
		if net ~= firstNet then
			return false
		end
	end
	return true
end

local function part2()
	for i = 1001, #distances do
		local pair = distances[i]
		local a, b = pair[1], pair[2]
		merge(a, b)

		if isOneNetwork() then
			print(a[1] * b[1])
			break
		end
	end
end

part1()
part2()
