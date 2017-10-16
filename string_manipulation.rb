# A method to reverse a string in place.
require 'pry'
def string_reverse(my_string)

  last_position = (my_string.length - 1)

  first_position = 0

  while last_position > first_position
    first_letter = my_string[first_position]
    last_letter = my_string[last_position]

    my_string[first_position] = last_letter
    my_string[last_position] = first_letter

    last_position -= 1
    first_position += 1
  end

  my_string

end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  first_position = 0
  last_position = (my_words.length - 1)

  word = ""
  word_starting_index = 0
  word_ending_index = 0
  until first_position == last_position + 1
    character = my_words[first_position]
    if character == " "
      my_words[word_starting_index .. word_ending_index] = string_reverse(word)
      my_words[first_position] = character
      word = ""
      first_position += 1
      word_starting_index = first_position
    else
      word += character
      word_ending_index = first_position
      first_position += 1
    end
  end
  my_words[word_starting_index .. word_ending_index] = string_reverse(word)
end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  reverse_words(my_sentence)
  string_reverse(my_sentence)
end

# A method to check if the input my_string is a palindrome.
# Return true if the my_string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  string_fixed = my_phrase.split.join
  first_position = 0
  last_position = string_fixed.length - 1

  while first_position != last_position

    case
    when string_fixed[first_position] != string_fixed[last_position]
      return false
      exit
    when string_fixed[first_position] == string_fixed[last_position]
      first_position += 1
      last_position -= 1
    end
    return true
  end
end

# A method that updates the my_string by replacing consecutive repeating characters
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
