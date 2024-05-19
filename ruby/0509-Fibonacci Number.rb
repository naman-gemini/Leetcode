# @param {Integer} n
# @return {Integer}
def fib(n)
	a, b = 0, 1
	n.times do
		b, a = a + b, b
	end
	a
end