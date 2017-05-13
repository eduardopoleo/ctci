def transform(matrix)
  m = matrix.length
  n = matrix.first.length
  ##### Space 2 * N*M ####
  # This shit is dangerous
  # zero_matrix = [[]] * m
  # zero_matrix = []

  # good idea but we can extended to also keep track of the rows that are 0
  # is_j_zero = []
  #
  # for i in 0...m
  #   zero_matrix << []
  # end
  #
  # for i in 0...m
  #   for j in 0...n
  #     if matrix[i][j] == 0
  #       zero_matrix[i] = [0] * n
  #       is_j_zero[j] = true
  #     end
  #   end
  # end
  #
  # for i in 0...m
  #   for j in 0...n
  #     if is_j_zero[j]
  #       zero_matrix[i][j] = 0
  #     else
  #       if zero_matrix[i][j] != 0
  #         zero_matrix[i][j] = matrix[i][j]
  #       end
  #     end
  #   end
  # end
  #
  # zero_matrix
  # This solution is O(N*M) but space 2 * N*M

  ###### Space N+M ######

  # row = []
  # column = []
  #
  # for i in 0...m
  #   for j in 0...n
  #     if matrix[i][j] == 0
  #       row[i] = true
  #       column[j] = true
  #     end
  #   end
  # end
  #
  # for i in 0...m
  #   if row[i]
  #     nullify_row(matrix, i)
  #   end
  # end
  #
  # for j in 0...n
  #   if column[j]
  #     nullify_column(matrix, j)
  #   end
  # end
  #
  # matrix

  ####### Space 1 ######
  # The trick is to use the first row and column a a marker to see if there is
  # a zero

  # Find if there are 0 in the first row and column (Done previously cuz is going to be mutated)
  # Loop through the rest of the matrix and use the the first and last columns as tracker of where are there 0
  # Loop through the first row and nullify all the columns where theres zeros
  # Loop throug the first columns and nullify all the row where zeros
  # nullify the first row and column depending if there were zeros originally on it
  row_contains_zero = false
  column_contains_zero = false

  for j in 0...n
    if matrix[0][j] == 0
      row_contains_zero = true
    end
  end

  for i in 0...m
    if matrix[i][0] == 0
      column_contains_zero = true
    end
  end

  for i in 1...m
    for j in 1...n
      if matrix[i][j] == 0
        matrix[0][j] = 0
        matrix[i][0] = 0
      end
    end
  end

  for j in 0...n
    if matrix[0][j] == 0
      nullify_column(matrix, j)
    end
  end

  for i in 0...m
    if matrix[i][0] == 0
      nullify_row(matrix, i)
    end
  end

  if row_contains_zero
    nullify_row(matrix, 0)
  end

  if column_contains_zero
    nullify_column(matrix, 0)
  end

  matrix
end

def nullify_row(matrix, i)
  for j in 0...matrix.first.length
    matrix[i][j] = 0
  end
end

def nullify_column(matrix, j)
  for i in 0...matrix.length
    matrix[i][j] = 0
  end
end


matrix = [[1, 2, 3], [0, 2, 3], [1, 2, 3]]

# [[0, 2, 3], [0, 0, 0], [0, 2, 3]]

p transform(matrix)
