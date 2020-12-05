
slope_segments = ARGF.readlines.map { |row| row.chomp.split('') }

directions = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2]
]

def sum_trees_on_slopes(slope_segments, right_value, skip_lines_value)
  position = 0
  slope_segments = slope_segments.select { |x| (slope_segments.index(x) % 2).zero? } if skip_lines_value != 1
  segments_with_collisions = 
    slope_segments.filter do |segment|
      encountered_trees = segment[position % segment.size] == '#'
      position += right_value
      encountered_trees
    end
  segments_with_collisions.size
end

def multiply_trees(tree_sum)
  puts tree_sum.reduce(:*)
end

tree_sum = directions.map { |route| sum_trees_on_slopes(slope_segments, route.first, route[1]) }

multiply_trees(tree_sum)