require 'pry'
# A method to reverse a string in place.
def string_reverse(my_string)
  last_index = my_string.length - 1 # lines 3- 6 O(1)
  first_index = 0
  temp = ""
  split_num = my_string.length / 2
  split_num.times do # O(n/2)
    temp = my_string[first_index]
    my_string[first_index] = my_string[last_index]
    my_string[last_index] = temp
    first_index += 1
    last_index -= 1
  end
end # O(1) + O(n) = O(n)

def scoped_reverse(my_string, start_index, last_index)
  while last_index > start_index
    temp = my_string[start_index]
    my_string[start_index] = my_string[last_index]
    my_string[last_index] = temp
    start_index += 1
    last_index -= 1
  end
end

# A method to reverse each word in a sentence, in place.
# Time Complexity = O(n); Iterates through entire length of string
# Space Complexity = Constant; Only new variables are i to hold the index.
def reverse_words(my_words)
  i = 0
  while my_words[i] != nil
    if my_words[i] != ' '
      start_index = i
      i += 1
      while my_words[i] != ' ' && my_words[i] != nil
        i += 1
      end
      last_index = i - 1
      scoped_reverse(my_words, start_index, last_index)
    else
      i += 1
    end
  end
end

# A method to reverse the words in a sentence, in place.
# Time Complexity = O(n); Iterates through entire length of string.
# Space Complexity = Constant; Only new variables are i and original_length
def reverse_sentence(my_sentence)
  i = -1
  original_length = my_sentence.length
  while my_sentence[i] != nil
    if my_sentence[i] != ' ' #identifies a word in sentence
      end_index = i
      i -= 1
      while my_sentence[i] != ' ' && my_sentence[i] != nil
        i -= 1
      end
      start_index = i + 1
    elsif my_sentence[i] == ' ' #identifies spacing within a sentence
      end_index = i
      i -= 1
      while my_sentence[i] == ' ' && my_sentence[i] != nil
        i -= 1
      end
      start_index = i + 1
    end
    i -= (((-1) * start_index) - ((-1)* end_index) + 1) #moves the index to account for shoveling word into end of sentence
    my_sentence << my_sentence[start_index..end_index]
  end
  my_sentence[0..-1] = my_sentence[(original_length * (-1))..-1] #replaces input in place with reversed sentence (-:
end


# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
# Time Complexity = O(n); The input is reversed using the string reverse method, which depends on the size of the input.
# Space Complexity = O(n); The reversed_phrase variable's size depends on the size of the input.
def palindrome_check(my_phrase)
  return false if my_phrase[0] != my_phrase[-1] # will not reverse phrase and return false if the first character of the string is not the same as the last character of the string.
  reversed_phrase = my_phrase[0..-1]
  string_reverse(reversed_phrase)
  if reversed_phrase == my_phrase
    return true
  else
    return false
  end
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by the process.
# Time Complexity = O(n), iterates through the entire string.
# Space Complexity = Constant, no new variables depend on the length or the input string.
def encode_repeating(my_string)
  i = 0
  original_length = my_string.length
  letter = ""
  while i != original_length + 1
    letter = my_string[i]
    letter_count = 1
    my_string << letter
    i+= 1
    while my_string[i] == letter && i != original_length + 1
      letter_count += 1
      i += 1
    end
      my_string << letter_count.to_s if letter_count > 2 # I shoveled in the letter count using the to_s method, is there a better way of doing this? besides string interpolation?
      my_string << letter if letter_count == 2
  end
  my_string[0..-1] = my_string[(original_length)...-1]

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
  binding.pry
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
