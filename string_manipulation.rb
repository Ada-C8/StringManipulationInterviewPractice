# Helpers
def swap_in_place(string, left, right) #time complexity = O(c), space = O(c) (temp_var)
  temp_var = string[left]
  string[left] = string[right]
  string[right] = temp_var
end


# A method to reverse a string in place.
def string_reverse(my_string)
  return my_string if my_string.length < 2

  i = 0

  while i < my_string.length/2
    swap_in_place(my_string, i, my_string.length-i-1)
    i +=1
  end

  return my_string
end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words) #with string_reverse
  return my_words if my_words.length < 2
  return string_reverse(my_words) if !my_words.include?(" ")

  first = 0

  my_words.length.times do |last |
    if my_words[last].match(/\s/)
      my_words[first...last] = string_reverse(my_words[first...last])
      first = last + 1
    elsif last == (my_words.length - 1)
      my_words[first..last] = string_reverse(my_words[first..last])
    end
  end

  return my_words
end

def reverse_words2(my_words) #without #string_reverse
  return my_words if my_words.length < 2
  return string_reverse(my_words) if !my_words.include?(" ")

  first = 0

  my_words.length.times do |last |
    if my_words[last].match(/\s/)
      i = first
      j = last - 1
      while i < j
        swap_in_place(my_words, i, j)
        i +=1
        j -=1
      end
      first = last + 1
    elsif last == (my_words.length - 1)
      while first < last
        swap_in_place(my_words, first, last)
        first +=1
        last -=1
      end
    end
  end

  return my_words
end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  my_sentence = reverse_words(my_sentence)
  my_sentence = string_reverse(my_sentence)
end

# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  return my_phrase if my_phrase.length < 2

  i = 0

  while i < my_phrase.length/2
    return false if my_phrase[i] != my_phrase[my_phrase.length - i - 1]
    i += 1
  end

  return true
end

def palindrome_check2(my_phrase) #omitting white spaces
  i = 0
  j = my_phrase.length - 1

  while i < my_phrase.length/2
    i += 1 if my_phrase[i].match(/\s/)
    j -= 1 if my_phrase[j].match(/\s/)

    return false if my_phrase[i] != my_phrase[j]

    i += 1
    j -= 1
  end

  return true
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)
  return my_string if my_string.length < 3

  engaged = false
  counter = 3
  n = 0

  while n + 2 < my_string.length
    if (engaged && my_string[n] == my_string[n+2]) || (my_string[n] == my_string[n+1] && my_string[n] == my_string[n+2])
      engaged = true
      my_string[n+1..n+2] = "#{counter}" #THIS LINE!
      counter += 1
    else
      engaged = false
      counter = 3
      n += 1
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

puts "Test 2b: reversed words"
my_words = "I can be an  engineer"
puts "Original: #{my_words}"
reversed_words = "I nac eb na  reenigne"
reverse_words2(my_words)
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
puts "BUG: 'nurses run' is a palindrome and should return true" if palindrome_check2(phrase) != true
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

test4 = "babbf33x000j"
encode_repeating(test4)
if test4 != "babbf33x03j"
  puts "BUG! 'babbf33x000j' should get encoded to 'babbf33x03j', not '#{test4}'"
end
puts "Encode test complete."
