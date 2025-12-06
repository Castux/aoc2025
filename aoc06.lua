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
		for k = 1, #lines-1 do
			result = result + lines[k][i]
		end
	elseif op == "*" then
		result = 1
		for k = 1, #lines-1 do
			result = result * lines[k][i]
		end
	end
	total = total + result

end

print(total)
