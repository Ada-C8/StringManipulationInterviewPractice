# A method to reverse a string in place.
def string_reverse(my_string)
  # swap each element
  # move an index
  i = 0
  n = my_string.length
  while i < n/2
    first = my_string[i]
    my_string[i] = my_string[n-i-1]
    my_string[n-i-1] = first
    i += 1
  end
end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  # iterate through each characters
  # if space leave alone
  # create stack of letters
  # pop off onto string
  n = my_words.length
  i = 0
  # CAN_ 0123 NAC
  while i < n
    word = []
    j = i
    while my_words[j] != " " && j < n
      word << my_words[j]
      j += 1
    end
    while i < j
      my_words[i] = word.pop
      i += 1
    end
    i += 1
  end
end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  string_reverse(my_sentence)
  reverse_words(my_sentence)
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  i = 0
  j = my_phrase.length - 1
  while i < j
    if my_phrase[i] == " "
      i += 1
    end
    if my_phrase[j] == " "
      j -= 1
    end
    if my_phrase[i].downcase != my_phrase[j].downcase
      return false
    else
      i += 1
      j -= 1
    end
  end
  return true
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequncy. The replacement is done only if the
# string length will get reduced by the process.
# 012345678901
# aaabbbbbcccc will get replace to "a3b5c4"
# a3abbbbbcccc
# 012345678901
# a3bbbbbcccc-
# a3b5bbbcccc-
# a3b5cccc----
def encode_repeating(my_string)
  i = 0
  n = my_string.length
  while i < n
    first = my_string[i]
    i += 1
    j = 1
    while my_string[i] == first
      j += 1
      i += 1
    end
    if j > 2
      k = i-j+1
      my_string[k] = j.to_s
      k += 1
      shift = j-2
      while k < n - shift
        my_string[k] = my_string[k+shift]
        k += 1
      end
      my_string.slice!(n-shift..n)
      i -= shift
      n -= shift
    end
  end
end

### ---- END OF METHODS
puts "Test 1: reverse a string"
my_string = "Lovelace"
puts "Original string: #{my_string}"
reversed_string = "ecalevoL"
string_reverse(my_string)
if my_string == reversed_string
  puts "String reversed correctly. Reversed string: #{reversed_string}"
else
  puts "BUG! The reversed string should be '#{reversed_string}' and not '#{my_string}'"
end

puts "Test 2: reversed words"
my_words = "I can be an  engineer"
puts "Original: #{my_words}"
reversed_words = "I nac eb na  reenigne"
reverse_words(my_words)
if my_words == reversed_words
  puts "Words reversed correctly. Reversed words: #{reversed_words}"
else
  puts "BUG! The reversed words should be '#{reversed_words}' and not '#{my_words}'"
end

puts "Test 3: reversed sentence"
sentence = "Yoda  is   awesome"
puts "Original: #{sentence}"
reversed_sentence = "awesome   is  Yoda"
reverse_sentence(sentence)
if sentence == reversed_sentence
  puts "Sentence reversed correctly. Reversed sentence: '#{reversed_sentence}'"
else
  puts "BUG! The reversed sentence should be '#{reversed_sentence}' and not '#{sentence}'"
end

puts "Test 4: Palindrome check"
phrase = "madam"
puts "BUG: madam is a palindrome and should return true" if palindrome_check(phrase) != true
phrase = "empty"
puts "BUG: empty is not a palindrome and should return false" if palindrome_check(phrase) != false
# optional challenge
phrase = "nurses run"
puts "BUG: 'nurses run' is a palindrome and should return true" if palindrome_check(phrase) != true
puts "Palindrome test complete."

# Optional Question #5
puts "Test 5: Encode test"
test1 = "aaabbbbbcccc"
encode_repeating(test1)
if test1 != "a3b5c4"
  puts "BUG! 'aaabbbbbcccc' should get encoded to 'a3b5c4', not '#{test1}'"
end

test2 = "xxxyttttgeee"
encode_repeating(test2)
if test2 != "x3yt4ge3"
  puts "BUG! 'xxxyttttgeee' should get encoded to 'x3yt4ge3', not '#{test2}'"
end

test3 = "ddbbfffgjjjj"
encode_repeating(test3)
if test3 != "ddbbf3gj4"
  puts "BUG! 'ddbbfffgjjjj' should get encoded to 'ddbbf3gj4', not '#{test3}'"
end
puts "Encode test complete."
