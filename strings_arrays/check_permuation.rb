def permutation?(string1, string2)
  #### Storing char count in a hash ###
  ### O(N) the amount of time it takes to read the input ###
  ## Takes space cuz needs to instantiate 2 hash

  # char_map1 = char_map(string1)
  # char_map2 = char_map(string2)
  #
  # char_map2 == char_map1

  ### using arrays maps instead ###
  ##  Assuming that a-z ###
  ## construct one array and then substract it, better than comparing 2 hashes

  return false if string1.length != string2.length

  map = []

  string1.each_char do |char|
    code = char.ord

    if map[code]
      map[code] += 1
    else
      map[code] = 1
    end
  end

  string2.each_char do |char|
    code = char.ord

    return false unless map[code]
    map[code] -= 1
    return false if map[code] < 0
  end

  return true
end


# def char_map(s)
#   {}.tap do |map|
#     s.each_char { |char| map[char] ? map[char] += 1 : map[char] = 1 }
#   end
# end

string1 = '87654321'
string2 = 'v12345678'

puts permutation?(string1, string2)
