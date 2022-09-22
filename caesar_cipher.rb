
def caesar_cipher(string, shift)
    result = ''
    string.each_char do |char|
        base = char.ord < 91 ? 65 : 97
        # Modifies lowercase and uppercase
        if char.ord.between?(65, 90) || char.ord.between?(97,122)
            rotation = ((char.ord - base + shift) % 26) + base
            result +=  rotation.chr
        # Keep spaces & punctuation
        else  
            result += char
        end
    end
    result
end

puts caesar_cipher("What a string!", 5)

# ======================================
# Key concepts:

# .char
#   return an array of characters of a string.

# .each_char
#   Passes each character in str to the given block, 
#   or returns an enumerator if no block is given.
#   "hello".each_char {|c| print c, ' ' } => h e l l o

# .ord → integer
#   Returns the Integer ordinal of a one-character string.
#       "a".ord  => 97
#       "z".ord  => 122
#   Read more: 
#   https://ruby-doc.org/core-3.0.2/String.html#method-i-ord

# .chr([encoding]) → string
#   Returns a string containing the character represented by the int's value according to encoding.
#       65.chr  => "A"
#       90.chr  => "Z"
#   Read more:
#   https://ruby-doc.org/core-2.2.10/Integer.html#method-i-chr

# % modulo
#   use % operator to "wrap"
#       e.g.    (arrayIndex + arrayLength) % arrayLength
#       e.g.    index = (index + rangeLength + incrementAmount) % rangeLength
#       e.g.    index = (index + rangeLength - decrementAmount) % rangeLength
#   Read more:
#   https://dev.to/jvon1904/how-to-wrap-around-a-range-of-numbers-with-the-modulo-cdo
