local function part1()
	local lines = {}
	for line in io.lines "aoc06.txt" do
		local tmp = {}
		for m in line:gmatch "%S+" do
			table.insert(tmp, tonumber(m) or m)
		end
		table.insert(lines, tmp)
	end

	local total = 0

	for i = 1, #lines[1] do
		local op = lines[#lines][i]
		local result
		if op == "+" then
			result = 0
			for k = 1, #lines - 1 do
				result = result + lines[k][i]
			end
		elseif op == "*" then
			result = 1
			for k = 1, #lines - 1 do
				result = result * lines[k][i]
			end
		end
		total = total + result
	end

	print(total)
end

local function part2()
	local lines = {}
	for line in io.lines "aoc06.txt" do
		local tmp = {}
		for m in line:gmatch "." do
			table.insert(tmp, m)
		end
		table.insert(lines, tmp)
	end

	local total = 0
	local stack = {}
	for c = #lines[1], 1, -1 do
		local col = {}

		for r = 1, 4 do
			table.insert(col, lines[r][c])
		end
		local num = tonumber(table.concat(col))
		if num then
			table.insert(stack, num)
		end

		if lines[5][c] == "+" then
			local sum = 0
			for _, v in ipairs(stack) do
				sum = sum + v
			end

			total = total + sum
			stack = {}
		elseif lines[5][c] == "*" then
			local product = 1
			for _, v in ipairs(stack) do
				product = product * v
			end
			total = total + product
			stack = {}
		end
	end

	print(total)
end

part1()
part2()
