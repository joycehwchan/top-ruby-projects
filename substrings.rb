
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
    match = {}
    string_downcase = string.downcase

    dictionary.each do |word|
        match[word] = string_downcase.scan(word).count if string_downcase.include?(word)
    end

    return match 
end

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)


# ======================================

string_downcase.scan(word)

    substrings("below", dictionary)
#=> {"below"=>["below"], "down"=>[], "go"=>[], "going"=>[], "horn"=>[], "how"=>[], "howdy"=>[], "it"=>[], "i"=>[], "low"=>["low"], "own"=>[], "part"=>[], "partner"=>[], "sit"=>[]}

    substrings("Howdy partner, sit down! How's it going?", dictionary)
#=> {"below"=>[], "down"=>["down"], "go"=>["go"], "going"=>["going"], "horn"=>[], "how"=>["how", "how"], "howdy"=>["howdy"], "it"=>["it", "it"], "i"=>["i", "i", "i"], "low"=>[], "own"=>["own"], "part"=>["part"], "partner"=>["partner"], "sit"=>["sit"]}

# ======================================

string_downcase.scan(word).count

    substrings("below", dictionary)
#=> {"below"=>1, "down"=>0, "go"=>0, "going"=>0, "horn"=>0, "how"=>0, "howdy"=>0, "it"=>0, "i"=>0, "low"=>1, "own"=>0, "part"=>0, "partner"=>0, "sit"=>0}

    substrings("Howdy partner, sit down! How's it going?", dictionary)
#=>   {"below"=>0, "down"=>1, "go"=>1, "going"=>1, "horn"=>0, "how"=>2, "howdy"=>1, "it"=>2, "i"=>3, "low"=>0, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1}

# ======================================

# Key Concepts


# .split(pattern)
#   Divides str into substrings based on a delimiter, returning an array of these substrings.
#       .split(' ')     <-- splits on space
#       .split(/[^a-zA-z]/) <-- splits on non letters (lower & upper case)
#   The forward slashes / / mark the beginning and end of the regular expression.

# .scan(pattern)
#   Iterate through str, matching the pattern (which may be a Regexp or a String).
#       scan(pattern) → array
#   For each match, a result is generated and added to the result array.
#       "football".scan("o")   # => ["o", "o"]

# .count

# .include

# create new Hash
#   different ways to create new hash
#       match = Hash.new(0)
#       mathc = {}


