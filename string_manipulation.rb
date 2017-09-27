# A method to reverse a string in place.
def string_reverse(my_string)
  i = 0 # O(1)
  j = my_string.length - 1 # O(1)
  while i < j # O(n) we know that we need to iterate over the entire length of the array to reverse the order of the string
    temp_var = my_string[i] # O(1)
    my_string[i] = my_string[j]
    my_string[j] = temp_var
    i += 1
    j -= 1
  end
end
# Time: O(n) in the worst case
# Space: O(1) + O(1) + O(1) --> O(1)

# A method to reverse each word in a sentence, in place.
# 1. Find starting and ending index for each word
# 2. For each index pair, call helper method to reverse characters starting at starting index and ending at ending index
def reverse_words(my_words)
  i = 0 # O(1)
  start_index = 0 # O(1)
  end_index = 0 # O(1)

  while i < my_words.length # O(n) will need to iterate the entire length array to reverse all words
    if my_words[i] == " "
      end_index = i - 1
      my_words = reverse_word(start_index, end_index, my_words)
      start_index = i + 1
    elsif i == my_words.length - 1
      end_index = my_words.length - 1
      my_words = reverse_word(start_index, end_index, my_words)
    end
    i += 1
  end
end

# Helper method for reverse_words
def reverse_word(start_index, end_index, words)
  while start_index < end_index # O(n) will need to iterate over a portion of the entire string
    temp_var = words[start_index]
    words[start_index] = words[end_index]
    words[end_index] = temp_var
    start_index += 1
    end_index -= 1
  end
  return words # Returns all words with only one word reversed
end
# Time: O(n) + O(n) for WORST CASE  --> O(n)
# Space: O(1) --> Constant as no new data is being created


# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  string_reverse(my_sentence)
  reverse_words(my_sentence)
end
# Time: O(n) + O(n) --> O(n)
# Space: O(1) + O(1) = O(1) --> O(1) Independent. Never create new variables


# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  i = 0
  j = my_phrase.length - 1
  while i < j # O(n) Length of the entire array
    if my_phrase[i] == my_phrase[j]
      i += 1
      j -= 1
    elsif my_phrase[i] == " "
      i += 1
    elsif my_phrase[j] == " "
      j -= 1
    else
      return false
    end
  end
  return true
end
# Time: O(n)
# Space: O(1) - Independent of input size. No new variables are created


# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)
  i = 0
  start_index = 0
  stop_index = 0
  current_letter_count = 0
  current_letter = my_string[0]

  while i <= my_string.length - 1
    # This checks the length as the first condition
    if i == my_string.length - 1
      current_letter_count += 1 # Record count of next letter
      stop_index = my_string.length - 1 # Record stopping index
      my_string[start_index + 1] = current_letter_count.to_s # Replace letter after start index
      my_string.slice!(start_index + 2..stop_index) # Slice out rest of letters and my_string will shift down indexes
    # This will iterate if current_letter == string
    elsif my_string[i] == current_letter
      current_letter_count += 1
    # This will slice if count is greater or equal to 3
    elsif my_string[i] != current_letter && current_letter_count >= 3
      current_letter = my_string[i]
      stop_index = i - 1 # Record stopping index of previous letter
      my_string[start_index + 1] = current_letter_count.to_s # Replace letter after start index
      my_string.slice!(start_index + 2..stop_index) # Slice out rest of letters and my_string will shift down indexes
      start_index = start_index + 2 # Set start index of next letter to stop index
      i = start_index # Set current i to stop index
      current_letter_count = 1 # Record count of next letter
    # This will skip if the count is less than 3
    elsif my_string[i] != current_letter && current_letter_count < 3
      current_letter = my_string[i]
      current_letter_count = 1 # Record count of next letter
      start_index = i
    end
    i += 1
  end
end
# Time: O(n) as the worst case the entired string will be traversed
# Space: O(1) - Independent of input size. No new variables are created



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
  puts "BUG! 'aaabbb' should get encoded to 'a3b3', not '#{test1}'"
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
