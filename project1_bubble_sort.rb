def bubble_sort(array)
 	swapping = true
 	while swapping 
 		swapping = false
 		(array.length - 1).times do |number|
 			if array[number] - array[number +1] >= 1
 				array[number], array[number +1] = array[number + 1], array[number]
 				swapping = true
 			end
 		end
 	end
	print array	
end

bubble_sort([1,112,101,56,8,17,28,411,4,3,78,2,0,2])

def bubble_sort_by(array)
  swapping = true
  while swapping 
    swapping = false
    (array.length - 1).times do |number|
      if yield(array[number], array[number +1]) >= 1
        array[number], array[number +1] = array[number + 1], array[number]
        swapping = true
      end
    end
  end
  print array 
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end