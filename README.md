# String Manipulation Interview Practice
In this assignment, you'll design and implement some of the string manipulation functions that are commonly asked during interviews.
Remember that a string is an array of characters. Algorithms that worked on restricted arrays will work on strings as well.

## Exercises
Design and implement a method for each of the following. Do not use Ruby provided functionality for `.reverse` and `.reverse!`. You may use `.length`. Share and explain the time and space complexity for each method.
1. Design and implement a method to reverse a string in place.
   - e.g. original string = "Lovelace"
   - reversed string = "ecalevoL"
2. Design and implement a method to reverse each word in a sentence, in place.
   - e.g. original = "I can be an ; ; ;engineer"
   - reversed words = "I nac eb na ; ; ;reenigne" (Note how the count of white spaces gets preserved)
3. Design and implement a method to reverse the words in a sentence, in place.
   - e.g. original = "Yoda ; ; ;is; ; ; ;awesome"
   - reversed sentence = "awesome ; ; ; ;is ; ; ;Yoda" (Note how the count of white spaces gets preserved)
4. Design and implement a method to check if the input string is a palindrome. Return true if the string is a palindrome. Return false otherwise.
   - **Note**: Palindrome is a word, phrase or sentence that reads the same backwards as forwards. e.g. "madam"
   - [**Optional challenge**] Make the method ignore white spaces. e.g. Make it so that the method will return true for "nurses run"
5. [**Optional Challenge Question**] Design and implement a method that updates the string by replacing consecutive repeating characters with a number representing the frequncy. The replacement is done only if the string length will get reduced by the process. In addition to `.length`, you may use `.slice!` to implement this method.
   - e.g "aaabbbbbcccc" will get replace to "a3b5c4", since a is repeated 3 times, b is repeated 5 times and c is repeated 4 times
   - "xxxyttttgeee" will get replaced with "x3yt4ge3". 'y' and 'g' do not get replaced by "y1" and "g1" since that will increase the length.
   - "ddbbfffgjjjj" will get replaced with "ddbbf3gj4". "dd" and "bb" do not get replaced since the length will remain the same with "d1" and "b1". "g" does not get replaced with "g1" since that will increase the length.

Update the string_manipulation.rb file to implement the above methods.
