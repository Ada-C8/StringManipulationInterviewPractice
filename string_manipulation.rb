# A method to reverse a string in place.
def string_reverse(my_string)
  length = my_string.length
  i = 0

  if length >= 2
  (length / 2).times do
    temp = my_string[i]
    my_string[i] = my_string[length - 1]
    my_string[length - 1] = temp
    i += 1
    length -= 1
    end
  end
  return my_string
end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  length = my_words.length

  word_start = 0
  word_end = 0

  length.times do |i|
    if my_words[i] == " " || i == length - 1

      if my_words[i] == " "
        word_end = i - 1
      else
        word_end = i
      end

      my_words[word_start..word_end] = string_reverse(my_words[word_start..word_end])
      word_start = i + 1
      word_end = i + 1
    end
    i += 1
  end
  return my_words
end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  my_sentence = string_reverse(my_sentence)
  my_sentence = reverse_words(my_sentence)

  return my_sentence
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  if my_phrase.length > 0
    beg = 0
    fin = my_phrase.length - 1

    ((my_phrase.length) / 2).times do

      while my_phrase[beg] == " "
        beg += 1
      end

      while my_phrase[fin] == " "
        fin -= 1
      end

      if my_phrase[beg] != my_phrase[fin]
        return false
      end
    end
  end
  return true
end


# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequncy. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)
  counter = 1
  start = 0
  finish = 0
  i = 0

  until i > my_string.length do

    if i + 1 == my_string.length && counter >= 2
      my_string[start] = my_string[start] + counter.to_s
      i += 1
      break
    elsif (my_string[i] != my_string[i + 1]) && counter <= 2
      start = i + 1
      finish = i + 1
      counter = 1
      i += 1
      next
    elsif
      (my_string[i] != my_string[i + 1]) && counter >= 3
      my_string[start] = my_string[start] + counter.to_s
      start = i += 1
      counter = 1
    else
      counter += 1
      finish += 1
      i += 1
    end
  end

  if /[0-9]/.match(my_string)
    length = my_string.length
    i = 0
    until i > length do
      if my_string[i].to_i > 0
        num = my_string[i].to_i
        my_string.slice!((i + 1), (num - 1))
        i += 1
        length = my_string.length
      else
        i += 1
      end
    end
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
#
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
