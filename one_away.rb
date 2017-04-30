def one_away?(string1, string2)
  ### creating a map_counts and determine the character differences ##
#   counts = [0] * 128
#
#   string1.each_char do |c|
#     code = c.ord
#
#     if counts[code]
#       counts[code] += 1
#     else
#       counts[code] = 1
#     end
#   end
#
#   string2.each_char do |c|
#     code = c.ord
#
#     if counts[code]
#       counts[code] -= 1
#     else
#       counts[code] = -1
#     end
#   end
#
#   sum = 0
#   for i in 0...128
#     sum += counts[i]
#   end
#
#   return sum.abs <= 1
#   You must always go through all both strings
#
# O(l1 + l2) => N

  ### Comparing both strings simultanously ###

  if string1.length == string2.length
    return verify_replacement(string1, string2)
  elsif string1.length + 1 == string2.length
    return verify_insertion(string1, string2)
  elsif string1.length - 1 == string2.length
    # smaller first otherwise the comparison is not complete
    return verify_insertion(string2, string1)
  end

  return false
end

def verify_replacement(string1, string2)
  l = string1.length
  found_different = false

  for i in 0...l
    if string1[i] != string2[i]
      if found_different
        return false
      end
      found_different = true
    end
  end

  return true
end

def verify_insertion(string1, string2)
  index1 = 0
  index2 = 0
# only going to read until the you cover the smallest string
  while(index1 < string1.length && index2 < string2.length)
    if string1[index1] != string2[index2]
      if index1 != index2
        return false
      end

      index2 += 1
    else
      index1 += 1
      index2 += 1
    end
  end

  return true
end


string1 = "abcd"
string2 = "abced"

puts one_away?(string1, string2)
