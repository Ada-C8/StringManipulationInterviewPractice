# A method to reverse a string in place.
def string_reverse(my_string)
  if my_string.size < 2
    return my_string
  else
    first_char = 0
    last_char = (my_string.length - 1)

    while first_char < last_char
      #set temp to first character value
      temp = my_string[first_char]
      #set first character to last character value
      my_string[first_char] = my_string[last_char]
      #set last character to temp value, which has the first character
      my_string[last_char] = temp

      first_char += 1
      last_char -= 1
    end

    return my_string
  end

end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  if my_words.size < 2
    return my_words
  else
    final_word_idx = my_words.length - 1
    word_start_idx = 0
    word_end_idx = 0

    while word_start_idx < final_word_idx
      while my_words[word_start_idx] == " " #increment word_start_idx until it finds its first non-empty character
        word_start_idx += 1
      end

      word_end_idx = word_start_idx

      while my_words[word_end_idx + 1] != " " && word_end_idx != final_word_idx #increment word_end_idx until it finds its first non-empty character
        word_end_idx += 1
      end

      swap_start_idx = word_start_idx
      swap_end_idx = word_end_idx

      while swap_start_idx < swap_end_idx
        temp = my_words[swap_start_idx]
        my_words[swap_start_idx] = my_words[swap_end_idx]
        my_words[swap_end_idx] = temp
        swap_start_idx += 1
        swap_end_idx -= 1
      end

      word_start_idx = word_end_idx + 2
    end
  end
end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  return reverse_words(string_reverse(my_sentence))
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  #assuming my_phrase's letter case is uniform
  start_idx = 0
  end_idx = my_phrase.length - 1

  while start_idx < end_idx
    while my_phrase[start_idx] == " "
      start_idx += 1
    end

    while my_phrase[end_idx] == " "
      end_idx -= 1
    end

    if my_phrase[start_idx] == my_phrase[end_idx]
      start_idx += 1
      end_idx -= 1
    else
      return false
    end
  end

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
