require 'awesome_print'
# A method to reverse a string in place.
def string_reverse(my_string)
  length = my_string.length
  if length <= 1
    return my_string
  else
    i = 0
    j = length - 1
    while i < j
      original = my_string[i]
      my_string[i] = my_string[j]
      my_string[j] = original
      i += 1
      j -= 1
    end
  end
  return my_string
end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  length = my_words.length
  if length <= 1
    return my_words
  else
    whitespaces = (0...length).find_all { |j| my_words[j,1] == ' ' }
    i = 0
    until i == whitespaces.length
      min = (whitespaces[i-1]) + 1
      max = whitespaces[i]
      if i == 0 && max > 1
        min = 0
      elsif min > max
        min = max
      end
      reverse = string_reverse(my_words[min...max])
      my_words[min...max] = reverse
      i += 1
    end
    last = (whitespaces.last) + 1
    my_words[last...my_words.length] = string_reverse(my_words[last...my_words.length])
  end
  return my_words
end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  string_reverse(my_sentence)
  reverse_words(my_sentence)
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  length = my_phrase.length
  whitespaces = (0...length).find_all { |j| my_phrase[j,1] == ' ' }
  for space in whitespaces
    my_phrase[space] = ''
  end
  first_half = my_phrase[0...my_phrase.length/2]
  if my_phrase.length % 2 == 0
    second_half = my_phrase[(my_phrase.length/2)..my_phrase.length]
  else
    second_half = my_phrase[(my_phrase.length/2 + 1)..my_phrase.length]
  end
  string_reverse(first_half) == second_half ? true : false
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequncy. The replacement is done only if the
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
phrase = "nurses run"
puts "BUG: 'nurses run' is a palindrome and should return true" if palindrome_check(phrase) != true
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
