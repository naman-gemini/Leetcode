# @param {Integer[][]} people
# @return {Integer[][]}
def reconstruct_queue(people)
  people.sort_by! { |height, position| [-height, position] } # tallest ppl first
  people.each_with_object([]) { |p, arr| arr.insert(p[1], p) }
end