require 'pry'

# A method to reverse a string in place.
def string_reverse(my_string)
  temp = ""
  i = 0
  while i <= (my_string.length - 1)  / 2
    temp = my_string[i]
    my_string[i] = my_string[my_string.length - (1 + i)]
    my_string[my_string.length - (1 + i)] = temp
    i += 1
  end
end
# Time Complexity: O(n) because the only while loop is contingent on how long the string is
# Space Complexity: O(1), the only local variable is temp, no other variables are created


# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  i = 0

  while i <= my_words.length
    # get each word to reverse
    current_word = ""
    # a word ends if the last character is a space or nil
    while (my_words[i] != nil && my_words[i] != " ")
    current_word << my_words[i]
    i += 1
    end

    # reverse each word with string_reverse
    current_word_index = 0
    while(current_word_index < current_word.length)
      my_words[i - 1 - current_word_index] = current_word[current_word_index]
      current_word_index += 1
    end
    i += 1
  end

  # Time Complexity:  .length = O(N), inside loops = (O(M) + O(M); O(N * 2M)); O(N^2)
  #                   where m is the length of each word within my_words
  # Space Complexity: O(1), the only other variable I'm creating is my current_word and current_word_index variables.
  #                   And those variables get reassigned values.

end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  i = 0
  original_length = my_sentence.length
  word_array = []

  # gather the words and spaces into an array
  while i < my_sentence.length
    # save each word into array
    word = ""
    while my_sentence[i] != " " && my_sentence[i] != nil
      word << my_sentence[i]
      i += 1
    end
    word_array << word

    # save each space as its own object in array
    if my_sentence[i] == " "
      word_array << " "
      i += 1
    end
  end

  # get reversed sentence from word_array and put it back into my_sentence it backwards
  j = word_array.length - 1
  while j > -1
    my_sentence << word_array[j]
    j-=1
  end

  # delete the first half of the new string
  while my_sentence.length > original_length
    my_sentence[0] = ""
  end

end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  left_counter = 0
  right_counter = my_phrase.length - 1

  while left_counter != right_counter
    if my_phrase[left_counter] == " "
      left_counter += 1
      next
    end

    if my_phrase[right_counter] == " "
      right_counter -= 1
      next
    end
    if my_phrase[left_counter] != my_phrase[right_counter]
      return false
    end
    left_counter += 1
    right_counter -= 1
  end
  return true
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
