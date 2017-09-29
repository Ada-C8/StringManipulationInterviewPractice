# A method to reverse a string in place.
def string_reverse(my_string)
  i = 0
  j = my_string.length - 1
  while i < j
    temp = my_string[i]
    my_string[i] = my_string[j]
    my_string[j] = temp
    i += 1
    j -= 1
  end
end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  word_start = 0
  word_end = 0
  while word_start < my_words.length
    while my_words[word_end] != " " && word_end < my_words.length
      word_end += 1
    end

    i = word_start
    j = word_end - 1
    while i < j
      temp = my_words[i]
      my_words[i] = my_words[j]
      my_words[j] = temp
      i += 1
      j -= 1
    end

    while my_words[word_end] == " " && word_end < my_words.length
      word_end += 1
    end

    word_start = word_end
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

  #using string_reverse method
  # input = my_phrase.dup
  # string_reverse(my_phrase)
  # if my_phrase == input
  #   return true
  # else
  #   return false
  # end

  i = 0
  j = my_phrase.length - 1
  while i < j
    while my_phrase[i] == " " && i < j
      i += 1
    end
    while my_phrase[j] == " " && i < j
      j -= 1
    end

    if my_phrase[i] != my_phrase[j]
      return false
    end
    i += 1
    j -= 1
  end
  return true
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)

  #creating new string
  # new_string = ""
  # word_start = 0
  # word_end = 0
  # while word_end < my_string.length
  #   while word_end + 1 < my_string.length && my_string[word_end] == my_string[word_end + 1]
  #     word_end += 1
  #   end
  #   number = word_end - word_start
  #   if number == 0
  #     new_string << my_string[word_start]
  #   elsif number == 1
  #     new_string << "#{my_string[word_start]}#{my_string[word_end]}"
  #   else
  #     new_string << "#{my_string[word_start]}#{number + 1}"
  #   end
  #   word_start = word_end + 1
  #   word_end += 1
  # end
  #
  # return new_string

  #in place
  word_start = 0
  word_end = 0
  while word_end < my_string.length
    while word_end + 1 < my_string.length && my_string[word_end] == my_string[word_end + 1]
      word_end += 1
    end

    number = word_end - word_start
    if number > 1
      str = "#{number + 1}"
      my_string.insert(word_start + 1, str)
      my_string.slice!(word_start + str.length + 1, number)
      word_end = word_start + 1 + str.length
      word_start = word_end
    else
      word_start = word_end + 1
      word_end += 1
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

#my_tests
# my_words = "Hello"
# reverse_words = "olleH"
# reverse_words(my_words)
# if reverse_words == my_words
#   puts "Correct"
# else
#   puts "BUG"
# end
#
# my_words = "Hello "
# reverse_words = "olleH "
# reverse_words(my_words)
# if reverse_words == my_words
#   puts "Correct"
# else
#   puts "BUG"
# end
#
# my_words = " Hello  lor "
# reverse_words = " olleH  rol "
# reverse_words(my_words)
# if reverse_words == my_words
#   puts "Correct"
# else
#   puts "BUG"
# end

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

#my tests
# test4 = "aaaaaaaaaaa"
# encode_repeating(test4)
# if test4 != "a11"
#   puts "BUG! 'aaaaaaaaaaa' should get encoded to 'a11', not '#{test4}'"
# end
#
# test4 = "aaaaaaaaaaa"
# encode_repeating(test4)
# if test4 != "a11"
#   puts "BUG! 'aaaaaaaaaaa' should get encoded to 'a11', not '#{test4}'"
# end
#
# test5 = "baaaaaaaaaaa"
# encode_repeating(test5)
# if test5 != "ba11"
#   puts "BUG! 'baaaaaaaaaaa' should get encoded to 'ba11', not '#{test5}'"
# end
#
# test6 = "aaaaaaaaaaab"
# encode_repeating(test6)
# if test6 != "a11b"
#   puts "BUG! 'aaaaaaaaaaab' should get encoded to 'a11b', not '#{test6}'"
# end
#
# test7 = "a"
# encode_repeating(test7)
# if test7 != "a"
#   puts "BUG! 'a' should get encoded to 'a', not '#{test7}'"
# end
#
# test8 = ""
# encode_repeating(test8)
# if test8 != ""
#   puts "BUG! '' should get encoded to '', not '#{test8}'"
# end
#
# test9 = "abcdefhhhhhhhhggggggg"
# encode_repeating(test9)
# if test9 != "abcdefh8g7"
#   puts "BUG! 'abcdefhhhhhhhhggggggg' should get encoded to 'abcdefh8g7', not '#{test9}'"
# end
#
# test10 = "aaaaaaabbbb"
# encode_repeating(test10)
# if test10 != "a7b4"
#   puts "BUG! 'aaaaaaaabbbb' should get encoded to 'a7b4', not '#{test10}'"
# end

puts "Encode test complete."
