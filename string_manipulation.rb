require 'pry'

# A method to reverse a string in place.
def string_reverse(my_string)
  # arr_of_string = my_string.split("")

  last_index = my_string.length - 1 #=> O(1)
  first_index = 0 #=> O(1)
  # first = arr_of_string[first_index]
  # last = arr_of_string[last_index]
  temp = nil #=> O(1)

  until last_index < first_index #=> O(n/2)
    temp = my_string[first_index]
    my_string[first_index] = my_string[last_index]
    my_string[last_index] = temp
    first_index += 1
    last_index -= 1
  end

end

#=> time complexity O(n)
#=> space complexity => a few bytes; reverse string in place, not taking up any additional storage

# A method to reverse each word in a sentence, in place.

def scoped_reverse(string, first_index, last_index)
  # first_index = first_index
  # last_index = last_index

  temp = nil #=> O(1)

  while last_index > first_index #=> O(n/2)
    temp = string[first_index]
    string[first_index] = string[last_index]
    string[last_index] = temp
    first_index += 1
    last_index -= 1
  end

end

def reverse_words(my_words)
  start_index = nil
  last_index = nil

  i = 0

  while my_words[i] != nil
    if my_words[i] != " "
      start_index = i
      i += 1
      while my_words[i] != " " && my_words[i] != nil
        i += 1
      end
      last_index = i - 1

      scoped_reverse(my_words, start_index, last_index)
      #
      # string_to_reverse = my_words[start_index..last_index]
      # my_words[start_index..last_index] = string_reverse(string_to_reverse)
    else
      i += 1
    end
  end

  # arr_my_words = my_words.split
  # arr_my_words.map! { |word| string_reverse(word) }
  # my_words[0..-1] = reverse_words
end

#=>time complexity O(n), going through each character in the string. As the string grows the rate of time it takes to go through it grows at the same rate.
#=>space complexity is constant. Created 3 local variables. 6 bytes

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  #step 1: reverse individual words
  reverse_words(my_sentence)
  #time complexity: O(n), must go through each character in the string.

  #step 2: reverse the whole string
  start_index = 0
  end_index = my_sentence.length - 1

  while start_index < end_index
    #swap elements at start and end indices
    temp = my_sentence[start_index]
    my_sentence[start_index] = my_sentence[end_index]
    my_sentence[end_index] = temp

    start_index += 1
    end_index -= 1
    #time complexity: O(n), must go through every character in string.
  end

end

#time complexity: O(n) + O(n) = O(n)
#space complexity: for each step, taking up constant space using local variables.

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  start_index = 0
  end_index = my_phrase.length - 1

  while start_index < end_index
    while my_phrase[start_index] == " "
      start_index += 1
    end

    while my_phrase[end_index] == " "
      end_index -= 1
    end

    if my_phrase[start_index] == my_phrase[end_index]
    else
      return false
    end

    start_index += 1
    end_index -= 1
  end
  return true
end

#time complexity: O(n), must check every character in the string.
#space complexity: Constant, only creating a few local variables.

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequncy. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)
  index = 0
  letter_index = 0
  letter = my_string[letter_index]
  number_index = letter_index + 1

  while my_string[index] != nil
    count = 1
    index += 1
    while my_string[index] == letter
      count += 1
      index += 1
    end
    if count > 2
      #replace the first extra letter with count
      my_string[number_index] = count.to_s

      #delete extra letters that follow
      number_index += 1
      while my_string[number_index] == letter
        my_string.slice!(number_index)
        # number_index += 1
      end
    end

    letter_index = number_index
    index = letter_index
    letter = my_string[letter_index]
    number_index = letter_index + 1
  end
end

#time complexity is O(n) as we are checking every character for repeated ones.
#space complexity is constant as we are creating a few local variables, and replacing the characters in place.

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
