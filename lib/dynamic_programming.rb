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

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
