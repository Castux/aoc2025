local data = {}

for line in io.lines "aoc07.txt" do
	local row = {}
	for i = 1, #line do
		row[i] = line:sub(i, i)
	end
	table.insert(data, row)
end

local function process(rows)
	local function add(r, c, v)
		if rows[r][c] == "." then
			rows[r][c] = 0
		end
		rows[r][c] = rows[r][c] + v
	end

	for r = 1, #rows - 1 do
		for c = 1, #rows[r] do
			if rows[r][c] == "S" then
				rows[r + 1][c] = 1
			elseif type(rows[r][c]) == "number" then
				local n = rows[r][c]

				if rows[r + 1][c] == "^" then
					add(r + 1, c - 1, n)
					add(r + 1, c + 1, n)
				else
					add(r + 1, c, n)
				end
			end
		end
	end

	local count = 0
	local sum = 0
	for _, v in ipairs(rows[#rows]) do
		if type(v) == "number" then
			sum = sum + v
			count = count + 1
		end
	end
	print(count, sum)
end

process(data)
