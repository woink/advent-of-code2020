slope_segments = ARGF.readlines.map { |row| row.chomp.split('') }

position = 0
segments_with_collisions = 
  slope_segments.filter do |segment|
    encountered_trees = segment[position % segment.size] == '#'
    position += 3
    encountered_trees
  end

puts segments_with_collisions.size
