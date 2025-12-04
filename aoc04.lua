local data = {}

for txtline in io.lines("aoc04.txt") do
	local line = {}
	for i = 1, #txtline do
		local char = txtline:sub(i, i)
		line[i] = char == "@" and 1 or 0
	end
	table.insert(data, line)
end

local function countAdjacent(grid, r, c)
	return
		(grid[r - 1] and grid[r - 1][c - 1] or 0) +
		(grid[r - 1] and grid[r - 1][c] or 0) +
		(grid[r - 1] and grid[r - 1][c + 1] or 0) +
		(grid[r][c - 1] or 0) +
		(grid[r][c + 1] or 0) +
		(grid[r + 1] and grid[r + 1][c - 1] or 0) +
		(grid[r + 1] and grid[r + 1][c] or 0) +
		(grid[r + 1] and grid[r + 1][c + 1] or 0)
end

local function part1(grid)
	local count = 0
	for r = 1, #grid do
		for c = 1, #grid[r] do
			if grid[r][c] == 1 and countAdjacent(grid, r, c) < 4 then
				count = count + 1
			end
		end
	end
	return count
end

local function part2(grid)
	local current = grid

	local removed = 0
	while true do
		local didRemove = false
		local next = {}
		for r = 1, #current do
			next[r] = {}
			for c = 1, #current[r] do
				if current[r][c] == 0 then
					next[r][c] = 0
				elseif countAdjacent(current, r, c) < 4 then
					next[r][c] = 0
					removed = removed + 1
					didRemove = true
				else
					next[r][c] = 1
				end
			end
		end
		current = next
		if not didRemove then break end
	end

	return removed
end

print(part1(data))
print(part2(data))
