def is_unique?(word)
  ###### Cheating version #####
  # word.split("").uniq.size == word.size

  ###### Ineficient Version ####
  # l = word.size

  # for i in 0...l
  #   current_char = word[i]
  #   for j in (i + 1)...l
  #     return false if word[j] == current_char
  #   end
  # end
  #
  # return true

  # runtime => (N - 1) + (N - 2) + (N - 3) ... 1
  # same as 1, 2, 3, (N - 2) + (N - 1)  + N => N*(N + 1) / 2 => N^2
  # does not require any other data structure

  ##### Improved version 1 #####

  # alphabet = {}
  #
  # word.each_char do |c|
  #   return false if alphabet[c]
  #
  #   if !alphabet[c]
  #     alphabet[c] = true
  #   end
  # end
  #
  # return true

  # Now using a hash is not the most efficient way since it deals with hasing and
  # collisions etc

  #### Improved version 2 #####
  # Cast characters into ASCII code and store in boolean array
  # check the array
#
  # l = word.size
  #
  # char_set = Array.new(128)
  #
  # return false if char_set.size > 128
  #
  # for i in 0...l
  #   code = word[i].ord
  #   return false if char_set[code]
  #
  #   char_set[code] = true
  # end
  #
  # return true
  #
  # # if space usage is an issue we can even use bit vector of size 128 with 1 and 0

  ### Using bitmaps ####

  checker = 0
  l = word.size

  for i in 0...l
    code = word[i].ord
    if (checker & (1 << code)) > 0
      return false
    end

    checker |= (1 << code)
  end

  return true
end

puts is_unique?("asdfghjxcp$%%")
