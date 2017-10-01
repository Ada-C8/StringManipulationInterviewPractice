require 'pry'

# A method to reverse a string in place.
def string_reverse(my_string)
  n = (my_string.length)/2

  n.times do |i|
    temp = my_string[i]
    my_string[i] = my_string[-1 - i]
    my_string[-1 - i] = temp
  end
  return my_string
end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  phrase_length = my_words.length
  i = 0
  while i < phrase_length
    if my_words[i] != " " #start char count
      word_length = 1
      until my_words[i + word_length] == " " || my_words[i + word_length] == nil
        word_length += 1
      end
      (word_length/2).times do |j|
        temp = my_words[i + j]
        my_words[i + j] = my_words[i + word_length - 1 - j]
        my_words[i + word_length - 1 - j] = temp
      end
      i += word_length
    end
    i += 1
  end
  return my_words
end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  reversed_words = reverse_words(my_sentence)
  return string_reverse(reversed_words)
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  my_phrase.length.times do |i|
    if my_phrase[i] == " "
      my_phrase[i] = ""
    end
  end

  differences = 0
  i = 0

  while true
    if my_phrase[i] != my_phrase[-1 - i]
      differences += 1
    end
    if differences == 1
      return false
    end
    if i == (my_phrase.length/2)
      return true
    end
    i += 1
  end
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)
  #iterate through the characters
  #if next char equals current AND char after that equals current, start counting
  #replace the 2nd instance of char with count
  #shuffle remaining chars up by the number of chars being deleted
  i = 0
  while i < my_string.length
    if my_string[i] == my_string[i + 1] && my_string[i] == my_string[i + 2]
      count = 3
      while my_string[i] == my_string[i + count]
        count += 1
      end
      my_string[i + 1] = count.to_s
      # my_string.slice!((i + 2)..(i + count))

    end
    i += 1
  end
  return my_string
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
phrase = "nurses run"
puts "BUG: 'nurses run' is a palindrome and should return true" if palindrome_check(phrase) != true
puts "Palindrome test complete."

puts "Optional Question #5"
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
