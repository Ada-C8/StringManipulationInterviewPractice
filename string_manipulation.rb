# A method to reverse a string in place.
def string_reverse(my_string)
  length = my_string.length

  if length < 1
    return my_string
  end # if

  i = 0
  j = length - 1
  while i < j
    temp = my_string[i]
    my_string[i] = my_string[j]
    my_string[j] = temp
    i += 1
    j -= 1
  end # inner while
  return my_string
end # string_reverse

# A method to reverse each word in a sentence, in place.
# need to only reverse words
# Hint: Check if creating a helper method that reverses a subset of the string given starting index and ending index as parameters helps.
def reverse_words(my_words)
  string_length = my_words.length

  first_index = 0
  last_index = 0
  j = 0
  k = 0
  i = 0

  while i < (string_length - 1)
    #find a white space or the end of the word
    until my_words[i] =~ /^\s*$/ || i > string_length - 1
      last_index = i
      i += 1
    end # until
    # set the index of the start and end of the word to reverse within the sentence
    j = first_index
    k = last_index
    # reverse the word
    while j < k
      temp = my_words[j]
      my_words[j] = my_words[k]
      my_words[k] = temp
      j += 1
      k -= 1
    end # inner while
    # move forward in string to end of string or end of white space after reversed word
    while my_words[i] == ' ' && i < (string_length - 1)
      i += 1
    end # while

    #set first_index to the start of the next word to be reversed, or the end of the string
    first_index = i
  end # outer while
  return my_words
end # reverse_words


# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  # BELOW IS ATTEMPT TO REVERSE THE SENTENCE IN PLACE 
  # length = my_sentence.length
  # i = (length - 1)
  # starting_index = (length - 1)
  #
  # until i == 0
  #   until my_sentence[i] == ' ' || i == 0
  #     i -= 1
  #   end
  #   move_to_start = my_sentence[(i + 1)..starting_index]
  #   my_sentence = move_to_start << my_sentence
  #   puts "did i get here"
  #   puts " word:#{move_to_start}"
  #   starting_index = i
  #
  #   while my_sentence[i] == ' ' && i != 0
  #     i -= 1
  #   end # while
  #
  #   move_to_start = my_sentence[(i + 1)..starting_index]
  #   puts "space:#{move_to_start}"
  #   my_sentence = move_to_start << my_sentence    # words << word
  #   starting_index = i
  # end # while


  # BELOW WORKS TO REVERSE A SENTNCE, BUT IT DOESN'T DO IT IN PLACE
  length = my_sentence.length
  i = 0
  starting_index = 0
  words = []

  while i < (length - 1)
    until my_sentence[i] == ' ' || i > (length - 1)
      i += 1
    end
    word = my_sentence[starting_index..(i - 1)]
     words << word
    starting_index = i

    while my_sentence[i] == ' ' && i < (length - 1)
      i += 1
    end # while

    word = my_sentence[starting_index..(i - 1)]
     words << word
    starting_index = i
  end # while

  j = words.length
  reversed_words = []
   while j > 0
     j -= 1
     reversed_words << words[j]
   end
   sentence = reversed_words.join('')
   puts "the sentence is #{sentence}"
  return sentence
end # reverse_sentence

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  length = my_phrase.length
  my_phrase = my_phrase.downcase
  i = 0
  j = length - 1

  until i == j
    if my_phrase[i] != my_phrase[j]
      return false
    end # if
    i += 1
    j -= 1
  end # until
  return true
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)
  # TODO: make it work when there are multiple reapeated letter sections in a row (works for aaaaxbbbb but not aaabbb. Also doesn't work for aaahvbbbb)
  i = 0
  starting_index = 0

  while i < my_string.length
    counter = 0
    element = my_string[i]
    until my_string[i] != element || i > my_string.length - 1
      if my_string[i + 1] == element
        counter += 1
      end
      i += 1
    end # until
    # puts "counter is #{counter}"
    if counter > 1
      index = starting_index + counter
      # puts "index is #{index}"
      my_string[index] = (counter + 1).to_s
      removed = (my_string.slice!((index - (counter - 1))..(index - 1)).length)
      i = (i - removed)
    end

    i += 1
    starting_index = i
    # puts "starting_index is #{starting_index}"
    # puts "i is #{i}"
    # puts "Puts my_string is #{my_string}"
  end # outer while
  puts my_string
end # encode_repeating







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
