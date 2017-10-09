require 'pry'
def encode_repeating(my_string)
  i = 0
  starting_index = 0

  while i < my_string.length
    counter = 0
    element = my_string[i]
    puts "element = #{element}"
    until my_string[i] != element || i > my_string.length - 1
      if my_string[i + 1] == element
        counter += 1
      end
      i += 1

    end # until
    puts "counter is #{counter}"
    if counter > 1
      index = starting_index + counter
      puts "index is #{index}"
      my_string[index] = (counter + 1).to_s
      removed = (my_string.slice!((index - (counter - 1))..(index - 1)).length)
      i = (i - removed)
    end

    i += 1
    starting_index = i
    puts "starting_index is #{starting_index}"
    puts "i is #{i}"
    puts "Puts my_string is #{my_string}"
  end # outer while
  puts my_string
end # encode_repeating

string = "aaaaaaabghgkyyyyy"
string_2 = "aaahvbbbb"
encode_repeating(string_2)


# if counter > 1
#   my_string[i - 1] = counter.to_s
#     # my_string[(i + 1)..counter] == (counter + 1).to_s
# end # if

#   (counter).times do
#     my_string.slice!(i - 2)
#   end

# i = i - (counter)
# i += 1
# end # outer while
# return my_string
