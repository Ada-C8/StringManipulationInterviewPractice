# A method to reverse a string in place.
def string_reverse(my_string)
  length = my_string.length

  if length < 1
    return my_string
  end # if

  i = 0
  j = length - 1
  while i < j
    temp = my_string[i]
    my_string[i] = my_string[j]
    my_string[j] = temp
    i += 1
    j -= 1
  end # inner while
  return my_string
end # string_reverse

# A method to reverse each word in a sentence, in place.
# need to only reverse words
# Hint: Check if creating a helper method that reverses a subset of the string given starting index and ending index as parameters helps.
def reverse_words(my_words)
  string_length = my_words.length

  first_index = 0
  last_index = 0
  j = 0
  k = 0
  i = 0
  words = []

  while i < (string_length - 1)
    until my_words[i] =~ /^\s*$/ || i > string_length - 1
      last_index = i
      i += 1
    end # until
    j = first_index
    k = last_index
    while j < k
      temp = my_words[j]
      my_words[j] = my_words[k]
      my_words[k] = temp
      j += 1
      k -= 1
      word = my_words[first_index...last_index]
      if word[-1] =~ /^\s*$/
        word.chop
      end
      words << word
    end # inner while
    first_index = (last_index + 1)
    i += 1
  end # outer while
  words.join(" ")
  my_words = words
  return my_words
end # reverse_words


# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  puts "NOT IMPLEMENTED"
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  length = my_phrase.length
  my_phrase = my_phrase.downcase
  i = 0
  j = length - 1

  until i == j
    if my_phrase[i] != my_phrase[j]
      return false
    end # if
    i += 1
    j -= 1
  end # until
  return true
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)
  puts "NOT IMPLEMENTED"
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
# phrase = "nurses run"
# puts "BUG: 'nurses run' is a palindrome and should return true" if palindrome_check(phrase) != true
puts "Palindrome test complete."

# Optional Question #5
# puts "Test 5: Encode test"
# test1 = "aaabbbbbcccc"
# encode_repeating(test1)
# if test1 != "a3b5c4"
#   puts "BUG! 'aaabbbbbcccc' should get encoded to 'a3b5c4', not '#{test1}'"
# end
#
# test2 = "xxxyttttgeee"
# encode_repeating(test2)
# if test2 != "x3yt4ge3"
#   puts "BUG! 'xxxyttttgeee' should get encoded to 'x3yt4ge3', not '#{test2}'"
# end
#
# test3 = "ddbbfffgjjjj"
# encode_repeating(test3)
# if test3 != "ddbbf3gj4"
#   puts "BUG! 'ddbbfffgjjjj' should get encoded to 'ddbbf3gj4', not '#{test3}'"
# end
# puts "Encode test complete."
