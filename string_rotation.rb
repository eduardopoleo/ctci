def is_sub_string(s1, s2)
  # O(l1 + l2)
  # 128 ~ 1
  # ### This solution awnsers the question: are this strings permutation of
  # each other. Which is a more general question
  # All rotation are permutations but are all permutation rotations?
  # no aaabbb will not match a ababab patter.

  # l1 = s1.length
  # l2 = s2.length
  #
  # return false if l1 != l2
  #
  # counts_map = []
  #
  # s1.each_char do |c|
  #   code = c.ord
  #   counts_map[code] ? counts_map[code] += 1 :   counts_map[code] = 1
  # end
  #
  # s2.each_char do |c|
  #   code = c.ord
  #   return false if !counts_map[code]
  #
  #   if counts_map[code]
  #     counts_map[code] -= 1
  #     return false if counts_map[code] < 0
  #   end
  # end
  #
  # return true



end


def is_substring?(s1, s2)
end

s1 = 'waterbottle'
s2 = 'erbottlewat'

p is_sub_string(s1, s2)
