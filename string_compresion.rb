def string_compression(string)
  count = 0
  new_string = ""
  # This is O(N)
  string.each_char.with_index do |c, i|
    count += 1

    if i <= string.length - 1 && c != string[i+1]
      # This solution is as "good" as using Java's string builder
      new_string = new_string << "#{c}#{count}"
      count = 0
    end
  end

  return new_string.length < string.length ? new_string : string

  ### Alternative solution ###
  # Calculate the size of the resulting string before hand to return at the
  # beginning if necesary
  # Initialized the StringBuilder with the right size. This makes sense in Java.
end

string = 'aabcccccaaa'
# string = 'abacd'

puts string_compression(string)
