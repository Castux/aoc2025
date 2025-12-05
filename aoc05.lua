local ranges = {}
local bounds = {}
local ids = {}

for line in io.lines "aoc05.txt" do
	local low, high = line:match "(%d+)%-(%d+)"
	if low and high then
		low, high = tonumber(low), tonumber(high) + 1
		table.insert(ranges, { low = low, high = high })
		table.insert(bounds, low)
		table.insert(bounds, high)
	elseif line ~= "" then
		table.insert(ids, tonumber(line))
	end
end

table.sort(bounds)

local valid = {}
for _, range in ipairs(ranges) do
	for i = 1, #bounds - 1 do
		if range.low <= bounds[i] and bounds[i + 1] <= range.high then
			valid[i] = true
		end
	end
end

local count = 0
local sum = 0
for i = 1, #bounds - 1 do
	if valid[i] then
		sum = sum + (bounds[i + 1] - bounds[i])

		for _, id in ipairs(ids) do
			if bounds[i] <= id and id < bounds[i + 1] then
				count = count + 1
			end
		end
	end
end

print(count, sum)
