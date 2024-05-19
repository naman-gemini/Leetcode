# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
  time = 0
  tally = frequency(tasks)

  while !tally.empty?
    max_key = tasks.max_by { |_, v| v }.first
    tally[max_key] == 1 ? tally.delete(max_key) : tally[max_key] -= 1
  end

  time
end

def frequency(tasks)
  tasks.each_with_object(Hash.new(0)) do |task, hsh|
    hsh[task] += 1
  end
end