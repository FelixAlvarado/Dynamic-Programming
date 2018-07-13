class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
  end

  def blair_nums(n)
    return 1 if n == 1 
    return 2 if n == 2 
    return @blair_cache[n] unless @blair_cache[n].nil?
    ans = blair_nums(n - 1) + blair_nums(n -2) + (1 + 2*(n - 2))
    @blair_cache[n] = ans 
    return @blair_cache[n]
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = {1 => [[1]], 2 => [[1,1],[2]], 3 => [[1,1,1],[1,2],[2,1],[3]]}
    return cache if n < 4 
    (4..n).each do |num|
    cache[num] = []
      (1..3).each do |i|
      cache[num] += cache[num - i].map {|arr| arr + [i]}
     end 
     end 
     cache 
  end

  def frog_hops_top_down(n)
    return [[1]] if n == 1
    return [[1,1], [2]] if n == 2
    return [[1,1,1], [1,2], [2,1], [3]] if n == 3
    ans = []
    (1..3).each do |i|
    ans += frog_hops_top_down(n - i).map {|arr| arr += [i]}
    end  
    ans
  end


  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)
    return [[1]] if n == 1 && k == 1
    return [[1,1]] if n == 2 && k == 1
    return [[1,1], [2]] if n == 2 && k == 2

  end

  # doesn't work with specs. copy sent answers on slack
  def knapsack(weights, values, capacity)
    return 0 if weights.length == 0 || capacity == 0
    solution_table = knapsack+table(weights, values,capactiy)
    solution_table[capacity][-1]

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    solution_table = []

    (0..capacity).each do |i|
      solution_table[i] = []
      (0...weights.length).each do |j|
        if i == 0 
          solution_table[i][j] = 0
        elsif j == 0 
          solution_table[i][j] = weights[j] < i ? 0 : values[j]
        else 
          option1 = solution_table[i][j - 1]
          option2 = weights[j] < i ? 0 : solution_table[i - weights[j]][j - 1] + values[j]
          optimum = [option1, option2].max
          solution_table[i][j] = optimum
        end 
      end 
    end 
    sotlution_table
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
