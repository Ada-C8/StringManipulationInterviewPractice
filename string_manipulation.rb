# A method to reverse a string in place.

def string_reverse(my_string)
  length = my_string.length/2.floor
  length.times do |i|
    temp = my_string[i]
    my_string[i] = my_string[(i+1) *-1]
    my_string[(i+1)*-1] = temp
  end

  return my_string
end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  if my_words.length <= 1
    return my_words
  else
    word_start = 0
    word_end = 0
    while word_end <= my_words.length
      if my_words[word_end+1] == " " or my_words[word_end+1] == nil


        holder = word_end

        this_word = my_words[word_start..word_end]

        word_length = this_word.length/2.floor

        word_length.times do |index|
           temp = my_words[word_start]
           my_words[word_start] = my_words[word_end]
           my_words[word_end] = temp
           word_start += 1
           word_end -= 1
        end

        word_start = holder+1

        while my_words[word_start] == " "
          word_start += 1

        end

        word_end = word_start +1

      else
        word_end += 1
      end
    end
  end

  return my_words
end


# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  words = my_sentence.split(" ")
  first_word_length = words[0].length
  current_index = my_sentence.length-1
  holder_index = 0

  while my_sentence[first_word_length*-1..-1] != words[0]
    word_index_holder = 0
    if my_sentence[current_index] == " "
      whitespace_counter = 0
      word_index_holder = current_index + 1

      while my_sentence[current_index] == " "
        current_index -= 1
        whitespace_counter += 1
      end

      substring_reversed = my_sentence[word_index_holder..-1]

      whitespace_counter.times do
        substring_reversed += " "
      end

      front_part = my_sentence[holder_index..(my_sentence.length-substring_reversed.length-1)]

      my_sentence = my_sentence[0...holder_index] + substring_reversed + front_part

      current_index = -1
      holder_index += substring_reversed.length
    else
      current_index -= 1
    end
  end
  return my_sentence
end


# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  if my_phrase.length <= 1
     return true
   end

   length = my_phrase.length/2

   length.times do |index|
     if my_phrase[index] != my_phrase[(index+1)*-1]
       return false
     end
   end

   return true
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)
  puts "NOT IMPLEMENTED"
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
sentence = reverse_sentence(sentence)
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
# puts "Test 5: Encode test"
# test1 = "aaabbbbbcccc"
# encode_repeating(test1)
# if test1 != "a3b5c4"
#   puts "BUG! 'aaabbbbbcccc' should get encoded to 'a3b5c4', not '#{test1}'"
# end
#
# test2 = "xxxyttttgeee"
# encode_repeating(test2)
# if test2 != "x3yt4ge3"
#   puts "BUG! 'xxxyttttgeee' should get encoded to 'x3yt4ge3', not '#{test2}'"
# end
#
# test3 = "ddbbfffgjjjj"
# encode_repeating(test3)
# if test3 != "ddbbf3gj4"
#   puts "BUG! 'ddbbfffgjjjj' should get encoded to 'ddbbf3gj4', not '#{test3}'"
# end
# puts "Encode test complete."
