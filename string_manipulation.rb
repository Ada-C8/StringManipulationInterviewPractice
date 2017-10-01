# A method to reverse a string in place.
def string_reverse(my_string)
  i = 0
  j = my_string.length - 1

  while i < j
    last = my_string[j]
    first = my_string[i]

    my_string[i] = last
    my_string[j] = first

    i += 1
    j -= 1
  end
  return my_string
end

# def string_reverse(my_string)
#   i = my_string.length - 1
#   reversed_str = ""
#
#   while i > -1
#     reversed_str << my_string[i]
#     puts my_string[i]
#     i -= 1
#   end
#   my_string = reversed_str
#   return my_string
# end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  i = 0
  j = 0

  # increment j until it equals an empty space or until it gets to the end of the last word in the string
  while  j < my_words.length
    while ( my_words[j] != " " ) || (j != my_words.length - 1)
      j += 1
    end
    # when j hits a space,then go back one space so j becomes the end of the word
    j -= 1
    # then reverse word using method above
    while i < j
      last = my_words[j]
      first = my_words[i]

      my_words[i] = last
      my_words[j] = first

      i += 1
      j -= 1
    end
    # re-assign j's position to i, so both the end and start points are in the same position
    i = j
    # move i and j are the same time
    while i == " "
      i += 1
      j += 1
    end
  end
  return my_words
end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  puts "NOT IMPLEMENTED"
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  puts "NOT IMPLEMENTED"
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
