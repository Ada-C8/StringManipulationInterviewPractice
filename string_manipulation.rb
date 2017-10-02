# A method to reverse a string in place.
# Design and implement a method to reverse a string in place.
#    - e.g. original string = "Lovelace"
#    - reversed string = "ecalevoL"

#####HELPER METHODS
=begin Given a string, a starting index and a ending index, this will return a reversed version of that string
Time complexity = O(n) Because I step through every index in the array once.
Space complexity = O constant Because I only use one variable, the temp variable, regardless of how long the string is.
=end

def reverse(string, begin_index, end_index)
  ((1 + end_index-begin_index)/2).times do
    temp = string[begin_index]
    string[end_index]
    string[begin_index] = string[end_index]
    string[end_index] = temp
    end_index -= 1
    begin_index += 1
  end
  return string
end

=begin
Given a string it returns an array of the indexies that mark the stop and start of each word.
Time complexity = O(n) Because I step through every index in the array once.
Space complexity = O(n)? Because I make an array and the length of that array is dependent on the contents of the my_words array
=end
def words_index(my_words)
  words_index = []
  holder = my_words[0] != " "

  if my_words[0] != " "
    words_index << 0
  end

  my_words.length.times do |i|
    if holder == true
    words_index << i-1 if my_words[i] == " "
    elsif holder == false
    words_index << i if my_words[i] =~ /[A-Za-z]/ ? true : false
    end
    holder = my_words[i] != " "
  end

  if words_index.length % 2 == 1
    words_index << my_words.length - 1
  end

  return words_index
end

=begin
I call a helper method to do this. The answer is the same as for the helper method.
Time complexity = O (n) Because I step through every index in the array once.
Space complexity = O constant Because I only use one variable, the temp variable, regardless of how long the string is.
=end
def string_reverse(my_string)
  reverse(my_string, 0, my_string.length-1)
  return my_string
end

=begin
I call two helper methods
Time complexity = O(n) for index_array + O(n) for reverse +O(n) for this method (since I visit each word) = O(n)
Space complexity: O(n) for index_array + O for reverse +
O for this method =O(n)
=end
def reverse_words(my_words)
  #make an array of indexes for the start and stop of each word
  index_array = words_index(my_words)
  #reverse each word in place
  k = 0
  (index_array.length/2).times do
    start = index_array[k]
    stop = index_array[k+1]
    reverse(my_words, start, stop)
    k += 2
  end
  return my_words
end

=begin
A method to reverse the words in a sentence, in place.
Time complexity =O (n^2)Because: O(n) for each time I call the word_index outside of a times loop.  O(n) for each .times loop, and O(n^2) for each time I call the words_index method inside of the times loop. Overall that is O(n^2) + O(n) + O(n^2) + O(n^2) + O(n) + O(n^2) = O(n^2)
Space complexity = O constant.
Because: I make the word_index array, and a counter variable
independent to the size of the input. (Except, the array would get bigger depending on the input... but I don't know how to interpret that so for now I am going to treat the array as one thing and not consider its length.)
Note: There must be a better way to do this.  My way seemes too messy.
=end

def reverse_sentence(my_sentence)
  #1. Switch position of words
  index = words_index(my_sentence)
  k=1
  (index.length/4).times do
    temp = my_sentence[index[k-1]..index[k]]
    my_sentence[index[k-1]..index[k]] = my_sentence[(index[-k-1])..index[-k]]
    index = words_index(my_sentence)
    my_sentence
    my_sentence[(index[-k-1])..index[-k]] = temp
    k += 2
  end

 #2. Swith position of white space so that it any white space
 #that was following a word is now preceding it
  index = words_index(my_sentence)
  k= 1
  ((index.length/4)).times do
    temp = my_sentence[(index[k]+1)..(index[k+1]-1)]
    my_sentence[(index[k]+1)..(index[k+1]-1)] = my_sentence[index[-k-2]+1..index[-k-1]-1]
    index = words_index(my_sentence)
    my_sentence[index[-k-2]+1..index[-k-1]-1] = temp
    k += 2
  end

  return my_sentence
end



# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
=begin
Time complexity: O(n)
Because: reverse the array, which is O(n).
Space complexity: O(n)
Because: I make a duplicate array that is the same size as the input array...0(n)?
=end
def palindrome_check(my_phrase)
  #You can this code to get rid of spaces, but it uses .delete, so I commented it out.
  # delete = []
  # (my_phrase.length-1).times do |i|
  #   if my_phrase[i] == " "
  #     delete << i
  #   end
  # end
  # index = 1
  # #delete spaces
  # delete.each do
  #   k= delete[-(index)]
  #   my_phrase [0..k]
  #   my_phrase = my_phrase [0..k-1] + my_phrase [k+1..-1]
  #   index += 1
  # end
  reversed=my_phrase.dup
  return my_phrase == reverse(reversed, 0,my_phrase.length-1)
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by the process.

#The below creates the right output, but does not change the string in place.
# def break_up_groups(my_string)
#   groups =[]
#   new_group = my_string[0]
#   my_string.length.times do |i|
#     if my_string[i] == my_string[i+1]
#       new_group += my_string[i+1]
#     else
#       groups << new_group
#       new_group = my_string[i+1]
#     end
#   end
#   return groups
# end
#
# def encode_repeating(my_string)
#   groups = break_up_groups(my_string)
#   answer = ""
#   groups.each do |group|
#     if group.length < 3
#       answer << group
#     else
#       answer << group[0] + group.length.to_s
#     end
#   end
#   my_string = answer
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
