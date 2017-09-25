# A method to reverse a string in place.
def string_reverse(my_string)
  i = 0
  j = my_string.length - 1
  while i < j
    letter = my_string[i]
    my_string[i] = my_string[j]
    my_string[j] = letter
    i += 1
    j -= 1
  end
  return my_string
end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  j = 0
  i = 0
  while j < my_words.length - 1
    #find the beginning of the word
    i += 1 while my_words[i] == " "
    #find the end of the word
    j += 1 while (my_words[j + 1] != " " && my_words[j] == " ") && (j != my_words.length - 1)
    #set counters for reverse
    k = i
    l = j
    #reverse the word in place
    while k < l
      letter = my_words[k]
      my_words[k] = my_words[l]
      my_words[l] = letter
      k += 1
      l -= 1
    end
    i = j + 2
    j = i
  end

end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  # hold index of first character of original my_sentence
  i = 0
  # hold index of last character of first group of chars (whitespace or word)
  j = 0
  if my_sentence[1] == " "
    j += 1 while my_sentence[j + 1] == " "
  else
    j += 1 while my_sentence[j + 1] != " "
  end
  # hold max_index
  max_index = my_sentence.length - 1
  while j < max_index
    # find first group of chars (whitespace or word) starting from the end of my_sentence
    first_char = max_index
    if my_sentence[max_index] == " "
      first_char -= 1 while my_sentence[first_char - 1] == " "
    else
      first_char -= 1 while my_sentence[first_char - 1] != " "
    end
    chars = my_sentence[first_char..max_index]
    # put this group of chars before the index of the first char of the original my_sentence
    my_sentence[first_char..max_index] = ""
    my_sentence[i] = chars + my_sentence[i]
    i += max_index - first_char + 1
    j += max_index - first_char + 1
  end
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  begin_char = 0
  end_char = my_phrase.length - 1
  while begin_char < end_char
    begin_char += 1 while my_phrase[begin_char] == " "
    end_char -= 1 while my_phrase[end_char] == " "
    return false if my_phrase[begin_char] != my_phrase[end_char]
    begin_char += 1
    end_char -= 1
  end
  return true
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)
  i = 0
  j = 0
  letter = my_string[i]
  while i < my_string.length
    j += 1 while my_string[j + 1] == letter
    if j - i >= 2
      my_string[(i + 1)..j] = (j - i + 1).to_s
    end
    additional = 0
    additional = 1 if j > i
    i += 1 + additional
    j = i
    letter = my_string[i]
  end
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
