# first occurance of target in a sorted arr
def lower_bound(arr, target)
  search(arr, 0, arr.size - 1, target)
end

def search(arr, lo, hi, target)
  return -1 if lo > hi
  
  mid = (lo + hi) / 2

  if (arr[mid] == target && lo == mid) || (arr[mid] == target && arr[mid - 1] < target)
    mid
  elsif arr[mid] < target
    search(arr, mid + 1, hi, target) # search right
  else
    search(arr, lo, mid - 1, target) # search left
  end
end