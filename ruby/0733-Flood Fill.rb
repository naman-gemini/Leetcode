# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
def flood_fill(image, sr, sc, new_color)
  @rows = image.size
  @cols = image[0].size

  dfs(image, sr, sc, new_color)
  image
end

def dfs(image, row, col, new_color)
  # already visited
  return if image[row][col] == new_color

  old_color = image[row][col]
  # set new color
  image[row][col] = new_color

  # recursively call on neighbors
  dfs(image, row - 1, col, new_color) if row - 1 >= 0 && image[row - 1][col] == old_color
  dfs(image, row, col + 1, new_color) if col + 1 < @cols && image[row][col + 1] == old_color
  dfs(image, row + 1, col, new_color) if row + 1 < @rows && image[row + 1][col] == old_color
  dfs(image, row, col - 1, new_color) if col - 1 >= 0 && image[row][col - 1] == old_color
end