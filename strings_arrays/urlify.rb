def urlify(string)
  ### cheat version ###
  # a = string.split('')
  #
  # a.each_with_index do |letter, index|
  #   if letter == " "
  #     a[index] = "%20"
  #   end
  # end
  #
  # a.join

  ### Modifying the string in place ###
  index = 0
  # each_char.with_index does not work cuz changing the string size on the fly
  while index < string.length
    if string[index] == " "
      string[index] = "%20"
      index += 2
    end

    index += 1
  end

  string
end


string = "Mr John Smith   "

puts urlify(string)
