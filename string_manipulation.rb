# require 'pry'

# A method to reverse a string in place.
def string_reverse(my_string)
  # puts "NOT IMPLEMENTED"
  str_len = my_string.length

  if my_string.length <= 1
    return my_string
  end

  # indexes of vals being swapped
  idx1 = 0
  idx2 = str_len - 1

# iterate through first half and last half of string
  while idx1 < idx2
    temp = my_string[idx1]
    my_string[idx1] = my_string[idx2]
    my_string[idx2] = temp

    idx1 += 1
    idx2 -= 1
  end

  return my_string
end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  # puts "NOT IMPLEMENTED"

  # store idx of beginning of word
  # iterate through word string until find whitespace
  # store idx - 1 of whitespace--this is the end of the word
  # reverse word in place

  words_len = my_words.length

  if words_len <= 1
    return my_words
  end
  # binding.pry

  word_begin = 0
  word_end = 0

  # check for string beginning w/whitespace
  while my_words[word_begin] == " "
    word_begin += 1
  end

  (word_begin...words_len).each do |idx|
    char = my_words[idx]

    # check for whitespace or end of string
    if char == " " || idx == words_len - 1
      # this is the end of the word; store idx - 1 or idx if end of string
        word_end = idx == words_len - 1 ? idx : idx - 1

        # reverse the found word in place
        while word_begin < word_end
          temp = my_words[word_begin]
          my_words[word_begin] = my_words[word_end]
          my_words[word_end] = temp

          word_begin += 1
          word_end -= 1
        end

        # set word_begin to be the current idx + 1
        word_begin = idx + 1
    end
  end

  return my_words
end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  # puts "NOT IMPLEMENTED"
  full_reverse = string_reverse(my_sentence)
  reversed_sentence = reverse_words(full_reverse)

  return reversed_sentence
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  # doesn't work with mixed upper/lowercase
  # puts "NOT IMPLEMENTED"
  phrase_len = my_phrase.length

  if phrase_len <= 1
    return true # assumes empty string counts as a palindrome
  end

  idx_start = 0
  idx_end = my_phrase.length - 1

  while idx_start < idx_end
    # check for whitespace
    idx_start += 1 if my_phrase[idx_start] == " "
    idx_end -= 1 if my_phrase[idx_end] == " "

    if my_phrase[idx_start] != my_phrase[idx_end]
      return false
    end

    idx_start += 1
    idx_end -= 1
  end

  return true
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequncy. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)
  # puts "NOT IMPLEMENTED"
  # iterate through string; if current char == prev char, add to count
  # else check count; if <= 2 (len not reduced), no changes; if > 2 (reduced)
  # change string from (current idx - count) to current idx to current char + count
  count = 1
  idx = 0

  while idx < my_string.length
    # assuming going out of range throws an error
    # check for repetition
    if idx < my_string.length - 1 && my_string[idx] == my_string[idx + 1]
      count += 1
      idx += 1

    elsif count > 2
      # keep first repeated char, mutate second into count, and delete all
      # repeated chars after that
      first_idx = idx - count + 1
      my_string[first_idx + 1] = count.to_s

      (count - 2).times do
        my_string.slice!(first_idx + 2)
      end

      idx = first_idx + 2
      count = 1

    else
      idx += 1
      count = 1
    end
  end
end

# def encode_repeating(my_string) # not using slice!
#   # instead of slice!, marks chars for deletion, then makes one final pass
#   # to copy non-deleted chars to a new array of appropriate length
#   repeated = 1
#   # idx = 0
#   deleted = 0
#   str_len = my_string.length
#
#   # while idx < str_len
#   (0...str_len).each do |idx|
#     # assuming going out of range throws an error
#     # check for repetition
#     if idx < str_len - 1 && my_string[idx] == my_string[idx + 1]
#       repeated += 1
#       # idx += 1
#
#     elsif repeated > 2
#       # keep first repeated char, mutate second into count, and delete all
#       # repeated chars after that
#       first_idx = idx - repeated + 1
#       my_string[first_idx + 1] = repeated.to_s
#
#       (repeated - 2).times do |dist_from_last|
#         # idx of repeated char is idx - (dist_from_last)
#         # set to special char (!)
#         my_string[idx - dist_from_last] = "!"
#         deleted += 1
#         # my_string.slice!(first_idx + 2)
#       end
#
#       # idx = first_idx + 2
#       repeated = 1
#
#     else
#       # idx += 1
#       repeated = 1
#     end
#   end
#
#   puts deleted
#
#   # iterate through array and copy non deleted chars into new array
#   new_str = " " * (str_len - deleted)
#   count = 0   # to track idx  differential between new array and array with elements to delete
#
#   (0...str_len).each do |idx|
#     if my_string[idx] == "!"
#       count += 1
#     else
#       new_str[idx - count] = my_string[idx]
#     end
#   end
#
#   my_string = new_str  # points my_string to a new val; original value is unchanged
#   return my_string
# end

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
