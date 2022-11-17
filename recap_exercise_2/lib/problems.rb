# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    if (num_1<=>num_2) == -1
        (num_1..num_1 * num_2).each do |check|
            return check if check % num_1 == 0 && check % num_2 == 0
        end
    elsif (num_1<=>num_2) == 1
        (num_2..num_1 * num_2).each do |check|
            return check if check % num_1 == 0 && check % num_2 == 0
        end
    else
        return num_1
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    out = Hash.new(0)
    (0...str.length-2).each do |idx|
        out[str[idx] + str[idx+1]] += 1
    end
    out.select {|k,v| v == out.values.max}.keys.first
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        out = Hash.new
        self.each do |k,v|
            out[v] = k
        end
        out
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        (0..self.length-1).each do |idx1|
            (0..self.length-1).each do |idx2|
                if idx2 > idx1
                    count += 1 if self[idx1] + self[idx2] == num
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new {|a,b| (a<=>b)}
        sorted = false
        while !sorted
            sorted = true
            (0...self.length-1).each do |idx|
                if prc.call(self[idx],self[idx+1]) == 1
                    self[idx], self[idx+1] = self[idx+1], self[idx]
                    sorted = false
                end
            end
        end
        self
    end
end
