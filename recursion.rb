def range(start_num, end_num)
  return [] if end_num < start_num
  result = []
  result << start_num
  return result if start_num == end_num
  result + range(start_num.next, end_num)
end

def recursive_sum(arr)
  return arr[0] if arr.length < 2
  arr[0] + recursive_sum(arr[1..-1])
end

def iterative_sum(arr)
  sum = 0
  arr.each {|num| sum += num}
  sum
end

def exponent_recursion_1(base, power)
  return 1 if power == 0
  base * exponent_recursion_1(base, power - 1)
end

def exponent_recursion_2(base, power)
  return 1 if power == 0
  # return base if power == 1
  halved_power = power / 2
  squared_of_half = exponent_recursion_2(base, halved_power) * exponent_recursion_2(base, halved_power)

  if power.even?
    squared_of_half
  else
    base * squared_of_half
  end
end

class Array
  def deep_dup
    duplicated_arr = []
    self.each do |elem|
      if elem.is_a?(Array)
        duplicated_arr << elem.deep_dup
      else
        duplicated_arr << elem
      end
    end
    duplicated_arr
  end
end

def fibonacci(n)
  return [0] if n == 0
  return [0, 1] if n == 1
  previous_fibonacci = fibonacci(n - 1)
  first_fibonacci_num = previous_fibonacci[-1]
  second_fibonacci_num = previous_fibonacci[-2]
  previous_fibonacci + [first_fibonacci_num + second_fibonacci_num]
end

def binary_search(arr, target)
  not_found = arr.length == 1 && arr[0] != target
  return nil if not_found

  middle_index = arr.length / 2
  middle_value = arr[middle_index]

  right_arr = arr[(middle_index + 1)..-1]
  not_found = right_arr.nil?
  return nil if not_found

  left_arr = arr[0...middle_index]
  not_found = left_arr.nil?
  return nil if not_found

  if target > middle_value
    size_of_first_half = middle_index + 1
    found_index = binary_search(right_arr, target)
    found_index.nil? ?  nil : found_index + size_of_first_half
  elsif target < middle_value
    binary_search(left_arr, target)
  else
    middle_index
  end
end

def merge_sort(arr)
  return arr if arr.length < 2
  middle_index = arr.length / 2
  right_arr = arr[0...middle_index]
  left_arr = arr[middle_index..-1]
  merge(merge_sort(left_arr),merge_sort(right_arr))
end

def merge(a, b)
  merged_arr = []

  i = 0
  j = 0
  until i == a.length || j == b.length
    first_num = a[i]
    second_num = b[j]

    if first_num < second_num
      merged_arr << first_num
      i += 1
    elsif first_num >= second_num
      merged_arr << second_num
      j += 1
    end
  end

  a[i..-1].each {|num| merged_arr << num} unless i == a.length

  b[j..-1].each {|num| merged_arr << num} unless j == b.length

  merged_arr
end

def subsets(arr)
  return [[]] if arr.empty?

  previous_subset = subsets(arr[0...-1])
  additional_combos = previous_subset.map do |array|
    array + [arr[-1]]
  end
  previous_subset + additional_combos
end

def make_change(target, coins)
  return [] if target == 0
  best_solution = nil
  result = []
  biggest_coin = coins.first

  if target >= biggest_coin
    target -= biggest_coin
    result << biggest_coin
  elsif target < biggest_coin
    coins.shift
  end

  result + make_change(target, coins)
end
