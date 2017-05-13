def is_pal_permutation?(string)
  counts = []
  # linear O(N) iterations over the string and the counts
  string.each_char.with_index do |c, i|
    next if c == " "
    code = c.ord

    if counts[code]
      counts[code] += 1
    else
      counts[code] = 1
    end
  end

  ## cheating with ruby
  # odds = map.select { |count| count && count.odd? }.size

  odds = 0

  counts.each do |count|
    return false if odds == 2

    if count && count % 2 != 0
      odds += 1
    end
  end

  return true

  # Can be optimized with a bit vector whey odds are 1. Then check that there are
  # more than 1 odd.
end


string = "arepera"
string = "tact coar"

puts is_pal_permutation?(string)
