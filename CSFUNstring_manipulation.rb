
#String manipulation

#1 reverse single word in place
def reverse(word)
  length = word.length/2.floor
  length.times do |i|
    temp = word[i]
    word[i] = word[(i+1) *-1]
    word[(i+1)*-1] = temp
  end

  puts s
end

#reverse('apples')


#2 reverse words in sentence in place

def reverseWords(sentence)
  if sentence.length <= 1
    return sentence
  else
    word_start = 0
    word_end = 1
    while word_end <= sentence.length
      if sentence[word_end+1] == " " or sentence[word_end+1] == nil
        holder = word_end

        this_word = sentence[word_start..word_end-1]
        word_length = this_word.length/2.floor

        word_length.times do |index|
           temp = sentence[word_start]
           sentence[word_start] = sentence[word_end]
           sentence[word_end] = temp
           word_start += 1
           word_end -= 1
        end

        word_start = holder +1
        while sentence[word_start] == " "
          word_start += 1
        end

        word_end = word_start +1

      else
        word_end += 1
      end
    end
  end

  puts sentence
end

string2 = 'hello goodbye dog cat sun moon'
#reverseWords(string2)

def reverseWordOrder(sentence)
  words = sentence.split(" ")
  first_word_length = words[0].length
  current_index = sentence.length-1
  holder_index = 0

  while sentence[first_word_length*-1..-1] != words[0]
    word_index_holder = 0
    if sentence[current_index] == " "
      whitespace_counter = 0
      word_index_holder = current_index + 1

      while sentence[current_index] == " "
        current_index -= 1
        whitespace_counter += 1
      end

      substring_reversed = sentence[word_index_holder..-1]

      whitespace_counter.times do
        substring_reversed += " "
      end

      front_part = sentence[holder_index..(sentence.length-substring_reversed.length-1)]

      sentence = sentence[0...holder_index] + substring_reversed + front_part

      current_index = -1
      holder_index += substring_reversed.length
    else
      current_index -= 1
    end
  end
  puts sentence
end

string3 = "Yoda is  Awesome today  is   cool"
reverseWordOrder(string3)

def isPalindrome(sentence)
  if sentence.length <= 1
    return true
  end

  length = sentence.length/2

  length.times do |index|
    if sentence[index] != sentence[(index+1)*-1]
      return false
    end
  end

  return true
end

string4 = 'madam '
puts isPalindrome(string4)
