def no_dupes?(arr)
    out = Hash.new(0)
    arr.each do |ele|
        out[ele] += 1
    end 
    out.select {|k,v| v == 1}.keys
end 

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
