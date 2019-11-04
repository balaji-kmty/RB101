# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

def bubble_sort!(arr)
  loop do
    flag = 0
    0.upto(arr.size - 2) do |count|
      if arr[count] > arr[count+1]
        arr[count+1], arr[count] = arr[count], arr[count+1]
        flag = 1
      end
    end
    break if flag == 0
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
