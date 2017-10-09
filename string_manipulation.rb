# A METHOD TO REVERSE A STRING IN PLACE
# NOTE: Space complexity is O(1) because the size of n does not affect the amount of memory used: the same variables (i, j, and temp) are created for any value of n.
#NOTE: The time complexity is O(1/2 n), or O(n). The while loop will run n/2 times (which is when i and i will be eqaul).
def string_reverse(my_string)
  length = my_string.length
#String of length 1 is already reversed
  if length < 1
    return my_string
  end # if

  i = 0
  j = length - 1
  # iterate through the string, swapping elements till the string is reversed
  while i < j
    temp = my_string[i]
    my_string[i] = my_string[j]
    my_string[j] = temp
    i += 1
    j -= 1
  end # inner while
  return my_string
end # string_reverse




# A MATHOF TO REVERSE EACH WORD IN A SENTENCE, IN PLACE
# need to only reverse words
# Hint: Check if creating a helper method that reverses a subset of the string given starting index and ending index as parameters helps.

 # NOTE: The time complexity of the loops in the reverse_words method are: O(n), O(fraction of n), O(fraction of n), and O(fraction of n). So, this method's time complexity is O(n).
# NOTE: the space complexity is O(1) because the same amount of memory is used no matter what the value of n is.
def reverse_words(my_words)
  string_length = my_words.length

  first_index = 0
  last_index = 0
  i = 0

#iterate through the whole string
  while i < (string_length - 1)
    #find a white space or the end of the word
    until my_words[i] =~ /^\s*$/ || i > string_length - 1
      # set last_index to i so you know where the word to reverse ends
      last_index = i
      i += 1
    end # until
    # set the index of the start and end of the word to reverse within the sentence

    # reverse the word (only the word, no white space included)
    while  first_index < last_index
      temp = my_words[first_index]
      my_words[first_index] = my_words[last_index]
      my_words[last_index] = temp
      first_index += 1
      last_index -= 1
    end # inner while
    # move forward in string to end of string or end of white space after reversed word. i will now be equal to the start of the next word or the end of the string.
    while my_words[i] == ' ' && i < (string_length - 1)
      i += 1
    end # while
    #set first_index to the start of the next word to be reversed, or the end of the string
    first_index = i
  end # outer while
  return my_words
end # reverse_words


# A METHOD TO REVERSE THE WORDS IN A SENTENCE, IN PLACE.
# NOTE: the space complexity is O(1) because as n increases the amount of memory used stays constant.
# NOTE: The time complexity of each method called is O(n). So, the time complexity of the reverse_sentence method is O(n) * O(n), or O(n^2).
def reverse_sentence(my_sentence)
  # NOTE: simply using the two previous methods will reverse the order of the words in a sentence!
  string_reverse(my_sentence)
  reverse_words(my_sentence)
  return my_sentence
end # reverse_sentence
  # NOTE: BELOW IS ATTEMPT TO REVERSE THE SENTENCE IN PLACE. It doesn't work well because it repeates the sentence twice. Also Shruit says that using .slice! and my_sentence[(i + 1)..starting_index] add too much space complexity.

  # length = my_sentence.length
  # i = (length - 1)
  # starting_index = (length - 1)
  #
  # until i < 0
  #   # select a word (starting at the end of the sentence)
  #   until my_sentence[i] == ' ' || i < 0
  #     i -= 1
  #   end
  #   # move the word to the end of the sentence
  #   move_to_start = my_sentence[(i + 1)..starting_index]
  #   my_sentence << move_to_start
  #   starting_index = i
  #
  #   # select spaces (starting at the end of the string)
  #   while my_sentence[i] == ' ' && !(i < 0)
  #     i -= 1
  #   end # while
  #   # move the spaces to the end of the word
  #   space_to_start = my_sentence[(i + 1)..starting_index]
  #   my_sentence << space_to_start
  #   starting_index = i
  # end # while
  # # Delete the orginal string only leaving the reversed string I added to the end of the origional string (starts at index length)
  #  my_sentence.slice!(0..(length - 1))


  # NOTE: BELOW WORKS TO REVERSE A SENTNCE, BUT I'M NOT SURE IF THIS QUALIFIES AS IN PLACE...
#   length = my_sentence.length
#   i = 0
#   starting_index = 0
#   words = []
#
#   while i < (length - 1)
#     until my_sentence[i] == ' ' || i > (length - 1)
#       i += 1
#     end
#     word = my_sentence[starting_index..(i - 1)]
#      words << word
#     starting_index = i
#
#     while my_sentence[i] == ' ' && i < (length - 1)
#       i += 1
#     end # while
#
#     word = my_sentence[starting_index..(i - 1)]
#      words << word
#     starting_index = i
#   end # while
#
#   j = words.length
#    while j > 0
#      j -= 1
#      my_sentence << words[j]
#    end
#   my_sentence.slice!(0..(length - 1))
#   return my_sentence


# A METHOD TO CHECK IF THE INPUT STRING IS A PALENDROME
# Return true if the string is a palindrome. Return false otherwise.
# NOTE: The time complexity is O(n/2), or O(n). This is because the loop will run till i == j, which means the loop will run n/2 times.
# NOTE: The space complexity is O(1) because as n increases the amount of memory used stays constant.
def palindrome_check(my_phrase)
  length = my_phrase.length
  my_phrase = my_phrase.downcase
  i = 0
  j = length - 1

# i == j is at the middle of the word
# move one character in on either side until you reach the center of the word, checking that each consecutive pair of characters at [i] and [j] are the same.
  until i == j
    if my_phrase[i] != my_phrase[j]
      return false
    end # if
    i += 1
    j -= 1
  end # until
  return true
end

# A METHOD THAT UPDATES THE STRING BY REPLACING CONSECUTIVE REPEATING CHARACTERS WITH A NUMBER REPRESENTING THE FREQUENCY. THE REPLACEMENT IS DONE ONLY IF THE STRING WILL GET REDUCED BY THE PROCESS
# NOTE: The time complexity of the encode_repeating method is O(n). There are internal loops that have a time complexity of O(some fraction of n), but since we drop constants the overall time complexity can be simplified to O(n).
# NOTE: The space complexity of the encode_repeating method is O(n) because I use .slice! to create the removed variable, which will increase with the size of n if my_string has repeated characters 
def encode_repeating(my_string)
  # TODO: make it work when there are multiple reapeated letter sections in a row (works for aaaaxbbbb but not aaabbb. Also doesn't work for aaahvbbbb). Why is this????
  i = 0
  starting_index = 0

# iterate though the whole string
  while i < my_string.length
    counter = 0
    # element is the character to check consecutive characters againts
    element = my_string[i]
    # add 1 to counter until the next character is the string does not equal element or you get to the end of the string
    until my_string[i] != element || i > my_string.length - 1
      if my_string[i + 1] == element
        counter += 1
      end
      i += 1
    end # until
     # Add the number of repeating characters to the string (at the index of the last consecutive repeating character) and then deleate all but one of the consecutivly repeated characters.
    if counter > 1
      #The index to add the number of repeated characters at
      index = starting_index + counter
      #Change [index] to the number of repeated characters
      my_string[index] = (counter + 1).to_s
      #remove all but the first repeated character from the string
      removed = (my_string.slice!((index - (counter - 1))..(index - 1)).length)
      # reset i to the index after the number (number = (counter + 1).to_s)
      i = (i - removed)
    end

    i +=
    # reset starting_index to i so that you can replace the correct character with a number in the next iteration of the loop.
    starting_index = i
  end # outer while
  puts my_string
end # encode_repeating







### ---- END OF METHODS ####################################################

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
