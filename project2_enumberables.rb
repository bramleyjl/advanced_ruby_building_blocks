module Enumerable
	
  def my_each
  	x = 0
	while x < self.size
		yield(self[x])
		x += 1
	end
  end

  def my_each_with_index
  	x = 0
  	while x < self.size
  		yield(self[x], x)
  		x += 1
  	end
  end

  def my_select
  	results = []
  	self.my_each do |x| 
  		if yield(x) 
  			results << x
  		end
  	end
  	return results
  end

  def my_all?
  	results = []
  	self.my_each do |x| 
  		if yield(x) 
  			results << x
  		end
  	end
  	self == results ? true : false
  end

  def my_any?
  	results = []
  	self.my_each do |x| 
  		if yield(x) 
  			results << x
  		end
  	end
  	results == [] ? false : true
  end

  def my_none?
  	results = []
  	self.my_each do |x| 
  		if yield(x) 
  			results << x
  		end
  	end
  	results == [] ? true : false
  end

  def my_count
  	results = []
  	self.my_each do |x| 
  		if yield(x) 
  			results << x
  		end
  	end
  	return results.length
  end

  def my_map
  	results = []
  	if proc
  		self.my_each do |x|
  			results << proc.call(x)
  		end
  	else
  		self.my_each do |x|  
  			results << yield(x)
  		end
  	end
  	return results
  end

  def my_inject
  	x = 1
  	memo = self[x - 1]
	while x < self.size
		memo = yield(memo, self[x])
		x += 1
	end
	return memo
  end

end

def multiply_els(array)
  array.my_inject do |memo, n|
  	memo * n
  end
end

times2 = Proc.new { |n| n * 2}

test = [1,2,3,4]

print test.my_map(&times2)


