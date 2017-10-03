# A method to reverse a string in place.
# Time Complexity: O(n), time depends on string length
# Space Complexity: O(1), no additional variables created
def string_reverse(my_string)
  length = my_string.length
  i = 0
  x = length - 1
  temp = 0
  mid_length = (length / 2)
  until i == mid_length
    temp = my_string[i]
    my_string[i] = my_string[x]
    my_string[x] = temp
    i += 1
    x -= 1
  end
  return my_string
end

# A method to reverse each word in a sentence, in place.
# Time Complexity: O(n ^ 2), each loop runs O(n) times and are nested
# Space Complexity: O(1), No additonal variables are created
def reverse_words(my_words)
  length = my_words.length
  i = 0
  start = 0
  temp = 0

  while i < length
    until (my_words[i] == " ") || (i == my_words.length)
      i += 1
    end
    finish = i
    while start < finish - 1
      temp = my_words[start]
      my_words[start] = my_words[finish - 1]
      my_words[finish - 1] = temp
      start += 1
      finish -= 1
    end
    i += 1
    start = i
  end
  return my_words
end

# A method to reverse the words in a sentence, in place.
# Time Complexity: O(n^2), reverse_words followed by string_reverse makes
# it O(n + n^2).
# Space Complexity: O(1), no additional variables are created
def reverse_sentence(my_sentence)
  reverse_words(my_sentence)
  string_reverse(my_sentence)
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
# Time Complexity: O(n^2), nested O(n) loops
# Space Complexity: O(1), no new variables are created.
def palindrome_check(my_phrase)
  i = 0
  while i < my_phrase.length
    if my_phrase[i] != my_phrase[-1 - i]
      return false
    else
      i += 1
    end
  end
  return true
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)

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
