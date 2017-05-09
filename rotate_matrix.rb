def rotate(matrix)
  ### Naive solution ###
  # l = matrix.length
  #
  # # this is dangerous as it creates three object with same reference in memory
  # # rotated_matrix = [[]] * l
  # rotated_matrix = []
  #
  # for i in 0...l
  #   rotated_matrix << []
  # end
  #
  # for i in 0...l
  #   # matrix => rotated_matrix
  #   # 1,1    => 1, 6
  #   # 1,2    => 2, 6
  #   # 1,3    => 3, 6
  #   for j in 0...l
  #     rotated_matrix[j][l - 1 - i] = matrix[i][j]
  #   end
  # end
  #
  # rotated_matrix


  ### In place solution ###

  l = matrix.length

  for i in 0...(l - 1)
    temp = matrix[i][l - 1 - i]
    matrix[j][l - 1 - i] = matrix[i][j]
  end

  rotated_matrix
end

matrix = [[1,2,3], [4,5,6], [7,8,9]]

p rotate(matrix)
