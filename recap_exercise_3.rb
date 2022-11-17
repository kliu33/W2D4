def no_dupes?(arr)
    out = Hash.new(0)
    arr.each do |ele|
        out[ele] += 1
    end 
    out.select {|k,v| v == 1}.keys
end 


require "byebug"

def no_consecutive_repeats?(arr)
    (0..arr.length-1).each do |idx|
        return false if arr[idx] == arr[idx+1]
    end 
    true
end 

def char_indices(str)
    out = Hash.new
    str.each_char.with_index do |char, idx|
        if out.has_key?(char)
            out[char] << idx
        else
            out[char] = [idx]
        end
    end
    out
end 

def substrings(str)
    out = []
    (0...str.length).each do |idx1|
        (0...str.length).each do |idx2|
            if idx2 >= idx1
                out << str[idx1..idx2].split("")
            end
        end
    end
    return out
end


def longest_streak(str)
    uniq = substrings(str).select {|sub| sub.uniq.length == 1}
    amax = uniq.map {|sub| sub.length}.max
    uniq.select {|sub| sub.length == amax}[-1].join("")
end 

p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')    
