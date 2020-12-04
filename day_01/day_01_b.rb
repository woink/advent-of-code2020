require 'httparty'

response = HTTParty.get('https://pastebin.com/raw/ShjcE5fW')
values = response.body.split(/\n/).map(&:to_i).sort

def find_triplets(values, target)
  pointer_one = 0
  pointer_three = values.length - 1
  pointer_two = pointer_one + 1
  while pointer_one < pointer_three
    sum = values[pointer_one] + values[pointer_three] + values[pointer_two]
    if sum == target
      puts values[pointer_one] * values[pointer_three] * values[pointer_two]
      return
    elsif sum < target
      pointer_one += 1
    elsif sum > target
      pointer_three -= 1
    end
  end
  puts(-1)
end

find_triplets(values, 2020)
