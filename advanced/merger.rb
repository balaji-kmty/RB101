# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

def merge(arr1, arr2)
  idx2 = 0
  new_arr = []

  arr1.each do |value|
    while idx2 < arr2.size && arr2[idx2] <= value
      new_arr << arr2[idx2]
      idx2 += 1
    end
    new_arr << value
  end

  new_arr.concat(arr2[idx2..-1])
end

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]
