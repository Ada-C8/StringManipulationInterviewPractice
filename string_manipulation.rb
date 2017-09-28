
# A method to reverse a string in place.
#Time Complexity : O(n) We go through array once.
# Space Complexity : O(1) we don't create another data.
def string_reverse(my_string)
  string_reverse_helper(my_string, 0, my_string.length-1)
end


# helper method to reverse string in place
def string_reverse_helper(my_string, start_index, end_index)
  while start_index < end_index
    temp = my_string[end_index] # e
    my_string[end_index] = my_string[start_index]
    my_string[start_index] = temp
    start_index += 1
    end_index -= 1
  end
end


# A method to reverse each word in a sentence, in place.
# Time Complexity : O(n) We go through array once,
# then we call helper function to reverse word, which is also O(n), so O(n)+ O(n) = O(2n)= O(n)
# Space Complexity : O(1) we don't create new data, we reverse in place

def reverse_words(my_words)
  start_index = 0
  end_index = 0

  while start_index < my_words.length && end_index < my_words.length
    if end_index == my_words.length - 1
      string_reverse_helper(my_words, start_index, end_index)
      break
    end
    if my_words[end_index] == " "
      # reverse the substring
      string_reverse_helper(my_words, start_index, end_index - 1)

      # skip over the whitespaces
      while my_words[end_index] == " "
        end_index += 1
      end

      # reset start_index
      start_index = end_index
      end_index += 1
    else
      end_index +=1
    end
  end
end


# A method to reverse the words in a sentence, in place.
#Time Complexity : O(n) We call 2 methods with both O(n) time complexity, and drop constant.
# Space Complexity : O(1) we used constant variables
def reverse_sentence(my_sentence)
  string_reverse(my_sentence)
  reverse_words(my_sentence)
end



# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.

# Time Complexity : O(n) We iterate through half of array.
# Depending on array's length it can take more or less time to execute, so it's linear.
# Space Complexity : O(1) constant.

def palindrome_check(my_phrase)
  if my_phrase.length < 1
    return false
  end
  i = 0
  while i < my_phrase.length/2
    last = my_phrase.length - 1 - i
    if my_phrase[i] != my_phrase[last]
      return false
    end
    i += 1
  end
  return true
end



# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by the process.

#Time Complexity : O(n) Iterates through array once
# Space Complexity : O(n) I created a variable that stores changes I make, which takes a space.

def encode_repeating(input_string)
  if (input_string.length <1)
    return;
  end

  result = ""
  prev = input_string[0]
  counter = 1
  i = 1
  while i < input_string.length

    if input_string[i] == prev
      counter += 1
    else
      result += encode_char(prev, counter)
      prev = input_string[i]
      counter = 1
    end
    i += 1
  end

  result += encode_char(prev, counter)
  # I stored modifications to result,so to be able to call input_string
 # I cleared original data from input_string, and copied data from result into it
  input_string.clear
  i = 0
  while i < result.length
    input_string[i] = result[i]
    i += 1
  end

  puts "Final: #{input_string}"
end
# helper method that returns char one or more times depending on the counter's value
def encode_char(char, counter)
  if counter == 1
    return char
  elsif counter == 2
    return char + char
  else
    return char + counter.to_s
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
#
test2 = "xxxyttttgeee"
encode_repeating(test2)
if test2 != "x3yt4ge3"
  puts "BUG! 'xxxyttttgeee' should get encoded to 'x3yt4ge3', not '#{test2}'"
end
#
test3 = "ddbbfffgjjjj"
encode_repeating(test3)
if test3 != "ddbbf3gj4"
  puts "BUG! 'ddbbfffgjjjj' should get encoded to 'ddbbf3gj4', not '#{test3}'"
end
puts "Encode test complete."
