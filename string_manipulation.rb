require 'pry'

# A method to reverse a string in place.
def string_reverse(my_string)
=begin
  1. while the string array contains letters
  2. take string and split it into individual letters and store in array
  3. create an emtpy array to hold 'reversed' letters
    - pop off the last letter and store in array
    - interate until no more letters are in the split string array
    - take reversed letter array and then join the letters
  4. return reversed string
=end

# The below does not pass your tests in terminal. However, if I load it into
# pry it works well. Is it because we are limited to .length as our only
# authorized ruby method?
  # if my_string.length > 0
  #   string = my_string.split("")
  #   reversed = []
  #   my_string.length.times do
  #     reversed << string.pop
  #   end
  #   return reversed.join
  # end


  # space complexity is o(1) because the storage is constant and does not depend on the string size
  # time complexity is o(n) - linear because of the times loop being depend on half the length of the string.
  i = 0
  j = my_string.length
  while i < j
    (j/2).times do
      temp = my_string[i]
      my_string[i] = my_string[j - 1]
      my_string[j - 1] = temp

      i += 1
      j -= 1
    end
  end
  return my_string
end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
=begin
-check if string has a character, if not you are finished.
-set i to 0
-set j to 0
-set k = 0
-until the value of index j is equal to ' '  or nil (end of string) increment j by 1
-when j is equal to ' '
-set k to j
-reverse word
-until the string value at index j is not ' ' increment j by 1
-continue through the string searching fo spaces and reversing words until no more
-string is left.

=end
  i = 0
  j = 0
  k = 0

  while i < my_words.length - 1
    # used to figure out values for each variable
    # puts "At the top #{i < my_words.length}"
    # puts "At top first until j= #{j}"
    # puts "At top first until i= #{i}"
    # puts "At top first until k= #{k}"
    i = j
    until my_words[j] == " " || my_words[j] == nil
      j += 1
    end
    # used to figure out values for each variable
    # puts "At bottom of first until j= #{j}"
    # puts "At bottom of first until i= #{i}"
    # puts "At bottom of first until k= #{k}"

    k = j

    # used to figure out values for each variable
    # puts "   k = j assignment #{k}"
    # puts " my_words[i] = #{my_words[i]}"
    # puts " my_words[k-1] = #{my_words[k -1]}"

    ((k - i)/2).times do
      temp = my_words[i]
      my_words[i] = my_words[k-1]
      my_words[k - 1] = temp

      i += 1
      k -= 1
    end

    # used to figure out values for each variable
    # puts "At top second until j= #{j}"
    # puts "At top second until i= #{i}"
    # puts "At top second until k= #{k}"

    until my_words[j] != " "
      j += 1
    end
    # used to figure out values for each variable
    # puts "At bottom second until j= #{j}"
    # puts "At bottom second until i= #{i}"
    # puts "At bottom second until k= #{k}"

    # used to figure out values for each variable
    # puts "At the bottom #{i < my_words.length}"
    # puts "     END OF LOOP        \n\n"
  end
  # return my_words
end



# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
=begin
  1.  want to reverse sentence
  2. we have to methods that will get us there.
  3. reverse the entire string so the word order is what we want. Each word will be backwards so we want to reverse each word so they read correctly
  4. utilize the reverse_words method to reverse each of them.
=end

  reversed_string = string_reverse(my_sentence)
  return words_reversed = reverse_words(reversed_string)
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
=begin
  Want: check if passed in phrase is a palindrome
  Have: string
  1. Check if string have value at index 0. if not done.
  2. reverse the string and then compare it to the Original
  3. If they are the same return true, if not false (outside the if statement.)
=end


  palindrome = string_reverse(my_phrase)
  if palindrome == my_phrase
    return true
  end
  return false
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
# phrase = "empty"
# puts "BUG: empty is not a palindrome and should return false" if palindrome_check(phrase) != false
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
