# A method to reverse a string in place.
def string_reverse(my_string)
  i = 0
  j = my_string.length - 1
  while i < j do
    temp = my_string[i]
    my_string[i] = my_string[j]
    my_string[j] = temp
    i += 1
    j -=1
  end
  return my_string
end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  index = 0
  i = 0
  while index < my_words.length
    until my_words[index] == " " || (index == my_words.length)
      index += 1
    end
    j = index - 1
    while i < j do
      temp = my_words[i]
      my_words[i] = my_words[j]
      my_words[j] = temp
      i += 1
      j -= 1
    end
    index = index + 1
    i = index
  end
  return my_words
end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  string_reverse(my_sentence)
  reverse_words(my_sentence)
  return my_sentence
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  i = 0
  j = my_phrase.length - 1
  while i < j
    if my_phrase[i] == " "
      i += 1
    elsif my_phrase[j] == " "
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
# with a number representing the frequncy. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)
  i = 0
  counter = 0
  index = 0
  while i < my_string.length
    while my_string[i] == my_string[i+1]
      counter += 1
      i += 1
    end
    # three or more consecutive repeating characters
    if counter > 1
      my_string[index..index+1] = "#{my_string[i]}#{counter+1}"
      index += 2
    # two repeating characters
    elsif counter == 1
      my_string[index..index+1] = my_string[i-1..i]
      index += 2
    # one non-repeating character
    else
      my_string[index] = my_string[i]
      index += 1
    end
    counter = 0
    i += 1
  end
  # delete remainig characters in string
  my_string.slice!(index..my_string.length-1)
  return my_string
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
