require 'httparty'

response = HTTParty.get('https://pastebin.com/raw/ShjcE5fW')
values = response.body.split(/\n/).map(&:to_i).sort

def find_two_pairs(values, target)
  pointer_one = 0
  pointer_two = values.length - 1
  while pointer_one < pointer_two
    sum = values[pointer_one] + values[pointer_two]
    if sum == target
      puts values[pointer_one] * values[pointer_two]
      return
    elsif sum < target
      pointer_one += 1
    elsif sum > target
      pointer_two -= 1
    end
  end
  puts(-1)
end

find_two_pairs(values, 2020)
