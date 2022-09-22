def bubble_sort(arr)
    num = arr.length - 1
    loop do
        sorted = false
        num.times do |i|
            if arr[i] > arr [i + 1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i] #switch indexed in an array
                sorted = true
            end
        end
        break if not sorted
    arr
end


print bubble_sort([4,3,78,2,0,2])

# => [0,2,2,3,4,78]


# Video (from Harvard’s CS50x on Bubble Sort)
# https://www.youtube.com/watch?v=8Kp-8OGwphY

# Video (simple explaination)
# https://www.youtube.com/watch?v=on9I9JPd2sY

# =================================

# Key concepts

# Change position of array element
#   array = [4, 5, 6, 7]
#   array[0], array[3] = array[3], array[0]
#   array # => [7, 5, 6, 4]

# loop for n times
#    n.times do
#      do stuff
#    end

# breaking loops