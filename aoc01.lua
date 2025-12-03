local dial = 50

local count1, count2 = 0, 0

for line in io.lines("aoc01.txt") do
	local letter, num = line:match("(%a)(%d+)")
	num = tonumber(num)

	local offset = letter == "L" and -1 or 1

	for i = 1,num do
		dial = dial + offset
		dial = dial % 100
		if dial == 0 then
			count2 = count2 + 1
		end
	end
	if dial == 0 then
		count1 = count1 + 1
	end
end

print(count1, count2)
