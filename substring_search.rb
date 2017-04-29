# what's the runtime of string concatenation
# N words of size x

def concat_all(words)
  sentence = ""

  words.each do |w|
    sentence += w
  end

  sentence
end

# sentence is copied everytime with each iteration
# 1) x (0 + x)
# 2) 2x (x + x) ...
# 3) 3x (2x + x)

# 1 + 2 + 3 ...n => n(n + 1) / 2 => O(n^2)

# runtime = xn^2
# This is very ineficient. One must use a StringBuilder? which is what?
