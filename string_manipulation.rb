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
  return my_string
end

##### QUESTIONS ########
# Is it poor design to have two temporary variables?
# def string_reverse(my_string)
#   i = 0
#   j = my_string.length - 1
#
#   while i < j
#     last = my_string[j]
#     first = my_string[i]
#
#     my_string[i] = last
#     my_string[j] = first
#
#     i += 1
#     j -= 1
#   end
#   return my_string
# end


## I am not sure why this solution isn't working
# def string_reverse(my_string)x  x
#   i = my_string.length - 1
#   reversed_str = ""
#
#   while i > -1
#     reversed_str << my_string[i]
#     puts my_string[i]
#     i -= 1
#   end
#   my_string = reversed_str
#   return my_string
# end

#######################################
def reverse_words(my_words)
  start = 0
  last_index = my_words.length - 1

  while start < last_index
    i = start
    until my_words[start] == " " || start > last_index
      start += 1
    end
    j = start - 1
    while i < j
      temp = my_words[i]

      my_words[i] = my_words[j]
      my_words[j] = temp

      i += 1
      j -= 1
    end
    start += 1
  end
  return my_words
end


#  I don't know why I couldn't get this to work
# def reverse_words(my_words)
#   i = 0
#   j = 0
#
# end_of_string = false
#
#   while j <= my_words.length- 1 do
#     if j == my_words.length- 1
#     end_of_string = true
#     end
#
#     if my_words[j] == " " || end_of_string
#       first_index = i
#       if end_of_string
#         last_index = j
#       else
#         last_index = j - 1
#       end
#
#       until last_index - first_index < 1
#         my_words[first_index], my_words[last_index] = my_words[last_index], my_words[first_index]
#         first_index += -1
#         last_index -= -1
#       end
#       j += 1
#       i = j
#     else
#       j += -1
#     end
#   end
#   return my_words
# end


# # # A method to reverse each word in a sentence, in place.
# # def reverse_words(my_words)
# #   i = 0
# #   j = 0
# #
# #   # increment j until it equals an empty space or until it gets to the end of the last word in the string
# #   while  j < my_words.length
# #     while (j != my_words.length - 1)
# #       if my_words[j] != " "
# #         puts j
# #         j += 1
# #       else
# #         j -= 1
# #         # when j hits a space,then go back one space so j becomes the end of the word
# #         puts "j was decremented and j is #{j}"
# #         if j - i + 1 > 1
# #           while i < j
# #             puts "inner loop"
# #             last = my_words[j]
# #             first = my_words[i]
# #
# #             my_words[i] = last
# #             my_words[j] = first
# #
# #             i += 1
# #             j -= 1
# #           end
# #         else
# #           i += 1
# #           j += 1
# #         end
# #       end
# #     end
# #         # re-assign j's position to i, so both the end and start points are in the same position
# #
# #         # move i and j are the same time
# #     while my_words[i] == " "
# #       i += 1
# #       j += 1
# #     end
# #   end
# #   j += 1
# #   return my_words
# # end
#
#

# A method to reverse the words in a sentence, in place.
# Algorithm
# check the input:
# If array of characters has more than 1 element proceed, otherwise, all done

# Initialize variables
# start is the index of the first element in the array of characters
# last_index is the index of the last element in the array of characters

# Steps
# utilize previous methods
# reverse the sentence
# reverse each word in the sentence

def reverse_sentence(my_sentence)
  i = 0
  j = my_sentence.length - 1

  while i < j
    temp = my_sentence[i]

    my_sentence[i] = my_sentence[j]
    my_sentence[j] = temp

    i += 1
    j -= 1
  end
  start = 0
  last_index = my_sentence.length - 1

  while start < last_index
    i = start
    until my_sentence[start] == " " || start > last_index
      start += 1
    end
    j = start - 1
    while i < j
      temp = my_sentence[i]

      my_sentence[i] = my_sentence[j]
      my_sentence[j] = temp

      i += 1
      j -= 1
    end
    start += 1
  end
  return my_sentence
end


#######################################################################
# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
# Algorithm
# check the input:
# if array of characters has more than 1 element proceed, otherwise, all done

# Initialize variables
# first_char is the index of the first element in the array of characters
# last_char is the index of the last element in the array of characters

# Steps
# while first_char is less than string length
# check if character at first_char[0] is equal to last_char[string length - 1]
# If equal, increment first_char and decrement last_char
# continue to compare every character beginning to end and reverse while looping
# if all characters are the same after looping return true
# if not return false

def palindrome_check(my_phrase)
  first = 0
  last = my_phrase.length - 1

  while first < my_phrase.length
    if my_phrase[first] == my_phrase[last]
      first += 1
      last -= 1
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
  i = 0
  n = my_string.length
  count = 0
  current_count = 1
  new_string = my_string[0]

  while i < n
    # if current character matches with the next, increment the counter
    if i < n && (my_string[i] == my_string[i+1])
      current_count += 1
    else
      #if current character doesn't match update result, reset count
      if current_count > count
        count = current_count
        new_string = str[i]
      end
      current_count  = 1
    end
    i += 1
  end
  return new_string

end

#
#   i = 0
#   j = i + 1
#   last_index = my_string.length - 1
#   letter_frequency = 0
#
#   while i < last_index
#     if my_string[i] == my_string[j]
#       letter_frequency += 1
#     elsif my_string[i] != my_string[j]
#       i = j
#     end
#     i += 1
#   end
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
# phrase = "nurses run"
# puts "BUG: 'nurses run' is a palindrome and should return true" if palindrome_check(phrase) != true
puts "Palindrome test complete."
#
# Optional Question #5
puts "Test 5: Encode test"
test1 = "aaabbbbbcccc"
encode_repeating(test1)
if test1 != "a3b5c4"
  puts "BUG! 'aaabbbbbcccc' should get encoded to 'a3b5c4', not '#{test1}'"
end

# # test2 = "xxxyttttgeee"
# # encode_repeating(test2)
# # if test2 != "x3yt4ge3"
# #   puts "BUG! 'xxxyttttgeee' should get encoded to 'x3yt4ge3', not '#{test2}'"
# # end
# #
# # test3 = "ddbbfffgjjjj"
# # encode_repeating(test3)
# # if test3 != "ddbbf3gj4"
# #   puts "BUG! 'ddbbfffgjjjj' should get encoded to 'ddbbf3gj4', not '#{test3}'"
# # end
# puts "Encode test complete."
