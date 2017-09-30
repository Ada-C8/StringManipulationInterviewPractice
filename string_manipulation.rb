# A method to reverse a string in place.
def string_reverse(my_string)
  i = 0
  j = my_string.length - 1
  reversed_string = my_string
  while i < (my_string.length  / 2)
    temp = reversed_string[i]
    reversed_string[i] = reversed_string[j]
    reversed_string[j] = temp
    i += 1
    j -= 1
  end
  return reversed_string
end

def reverse_words(my_words)
  i = 0
  start = 0
  segment = ""

  #check for space at start
  until my_words[i] != " "
    i += 1
    start += 1
  end

  while i < my_words.length
    if my_words[i] == " "
      my_words[start..(i-1)] = string_reverse(segment)
      segment = ""
      start = i + 1
    else
      segment << my_words[i]
    end #if statement
    i += 1
  end #while statement
  my_words[start..(i-1)] = string_reverse(segment)
  return my_words
end


# sentence = "Yoda  is   awesome"
# puts "Original: #{sentence}"
# reversed_sentence = "awesome   is  Yoda"
# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  string_reverse(my_sentence)
  return reverse_words(my_sentence)
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  i = 0
  j = my_phrase.length - 1

  until i >= j
    if my_phrase[i] == " "
      i += 1
    elsif my_phrase[j] == " "
      j -= 1
    end #first if statement

    if my_phrase[i] == my_phrase[j]
      i += 1
      j -= 1
    else
      return false
    end #second if statement
  end  #until
  return true
end #method


# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequncy. The replacement is done only if the
# string length will get reduced by the process.

def encode_repeating(my_string)
  i = 0
  j = 0

  until i == my_string.length

    letter_count = 1

    until my_string[j] != my_string[j + 1]
      letter_count += 1
      j += 1
    end #end until

    if letter_count > 2
      my_string[i + 1] = (letter_count).to_s
      my_string.slice!((i + 2)..(i + (letter_count - 1)))
      i += 2
      j = i
    elsif letter_count == 2
      i += 2
      j = i
    else
      i += 1
      j = i
    end

  end #end until

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
puts "optional challenge"
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
