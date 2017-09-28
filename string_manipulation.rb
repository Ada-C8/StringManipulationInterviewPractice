# A method to reverse a string in place.
def string_reverse(my_string)
  string_length = my_string.length

  ((string_length/2)).times do |i|
    temp = my_string[i]
    my_string[i] = my_string[string_length-(i+1)]
    my_string[string_length-(i+1)] = temp
  end
  my_string
end


# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  index_array = []

  my_words.length.times do |i|
    if !my_words.slice(i).match(/\s/)
      index_array << i
      # puts "Index_array = #{index_array}"
      if (i+1) == my_words.length
        my_words[index_array[0]..index_array[-1]] = string_reverse(my_words[index_array[0]..index_array[-1]])
        # puts string_reverse(my_words[index_array[0]..index_array[-1]])
        index_array = []
      elsif my_words.slice(i+1).match(/\s/)
        # puts "entered here"
        my_words[index_array[0]..index_array[-1]] = string_reverse(my_words[index_array[0]..index_array[-1]])
        # puts string_reverse(my_words[index_array[0]..index_array[-1]])
        index_array = []
      end
      # puts "my_words = #{my_words}"
    end
  end
  # my_words
end

## SHRUTI- QUESTION FOR YOU!- I've included below my first attempt at the above problem. It didn't work because it didn't reverse the words IN PLACE. Is there a way to "point" the resulting object to the object_id of the my_words variable, instead?
# def reverse_words(my_words)
#   id = my_words.object_id
#   puts "ID: #{id}"
#   word_length = my_words.length
#   word_array = []
#   chars = String.new
#
#   word_length.times do |i|
#     puts "#{i} - #{my_words[i]} - next letter: #{my_words[i+1]}"
#     if !my_words[i].match(/\s/)
#       chars += my_words[i]
#       puts "chars 1st loop = #{chars}"
#       if (i+1) == word_length
#         word_array << chars
#         chars = ""
#       elsif my_words[i+1].match(/\s/)
#         word_array << chars
#         chars = ""
#       end
#     elsif my_words[i].match(/\s/)
#       chars += my_words[i]
#       if !my_words[i+1].match(/\s/)
#         word_array << chars
#         chars = ""
#       end
#     end
#     puts "Word_array = #{word_array}"
#   end
#
#   word_array.each do |word|
#     string_reverse(word)
#   end
#   puts "Word_array = #{word_array}"
#   # my_words = word_array.join
#   # puts "my_words = #{my_words}"
#   id = my_words.object_id
#   puts "ID: #{id}"
#   return my_words
# end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  original_sentence = my_sentence.dup
  index_array= []
  word_array= []
  temp_index = []

  my_sentence.length.times do |i|
    if !my_sentence.slice(i).match(/\s/)
      temp_index << i

      if (i+1) == my_sentence.length
        left_word = my_sentence[temp_index[0]..temp_index[-1]]

        word_array << left_word
        index_array << temp_index[0]
        temp_index = []
      elsif my_sentence.slice(i+1).match(/\s/)

        left_word = my_sentence[temp_index[0]..temp_index[-1]]

        word_array << left_word
        index_array << temp_index[0]
        temp_index = []
      end
    elsif my_sentence.slice(i).match(/\s/)
      temp_index << i

      if !my_sentence.slice(i+1).match(/\s/)
        left_word = my_sentence[temp_index[0]..temp_index[-1]]
        index_array << temp_index[0]
        word_array << left_word
        temp_index = []
      end
    end
  end

  #REVERSE ARRAY
  (word_array.length)/2.times do |i|
    temp = word_array[i]
    word_array[i] = word_array[-i-1]
    word_array[-i-1] = temp
  end

  #PLUG IN ARRAY INTO STRING TO MODIFY IN PLACE
  index = 0
  word_array.length.times do |i|
    my_sentence.insert(index, word_array[i])
    index += word_array[i].length
  end

  #DELETES OUT ORIGINAL SENTENCE FROM THE END
  my_sentence.chomp!(original_sentence)
  my_sentence
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  if my_phrase.include?(" ")
    words = my_phrase.split(" ")
    my_phrase = words.join
  end

  original_phrase = my_phrase.dup
  phrase_length = my_phrase.length
  (phrase_length/2).times do |i|
    temp = my_phrase[i]
    my_phrase[i] = my_phrase[(-i-1)]
    my_phrase[(-i-1)] = temp
  end

  original_phrase == my_phrase
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
