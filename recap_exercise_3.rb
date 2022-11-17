require "byebug"

#######################################################################

def no_dupes?(arr)
    out = Hash.new(0)
    arr.each do |ele|
        out[ele] += 1
    end 
    out.select {|k,v| v == 1}.keys
end 

#######################################################################


def no_consecutive_repeats?(arr)
    (0..arr.length-1).each do |idx|
        return false if arr[idx] == arr[idx+1]
    end 
    true
end 

#######################################################################

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

#######################################################################

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

#######################################################################

def is_prime?(num)
    return false if num < 2
    if num > 2
        (2...num).each do |factor|
            if num % factor == 0
                return false
            end
        end
    end
    true
end

def bi_prime?(num)
    factors = []
    (1..num).each do |fac|
        factors << fac if num % fac == 0
    end 
    factors.each_with_index do |pr, idx|
        return true if is_prime?(factors[idx]) && is_prime?(factors[-1 * (idx+1)])
    end
    return false
end

def vigenere_cipher(message, keys)
    out = ""
    alpha = "abcdefghijklmnopqrstuvwxyz"
    message.each_char do |char|
        out += alpha[(alpha.index(char) + keys[0]) % 26]
        keys.rotate!
    end
    out
end 

def vowel_rotate(str)
    out = Array.new(str.length, :_)
    vow = "aeiou"
    vowels = []
    str.each_char.with_index do |char, idx|
        if vow.include?(char)
           vowels << char
        else
            out[idx] = char
        end
    end
    vowels = vowels.unshift(vowels.pop)
    out.each_with_index do |check, idx|
        if check == :_
            out[idx] = vowels[0] 
            vowels.rotate!
        end
    end
    out.join("")
end 