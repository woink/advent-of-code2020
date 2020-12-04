vals = File.readlines('input.txt')

valid_passwords = 0

vals.each do |val|
  val_split = val.split(/ /)
  letter_min, letter_max = val_split[0].split(/-/).map(&:to_i)
  given_letter = val_split[1][0]
  password = val_split[2]
  letter_freq = password.count(given_letter)

  valid_passwords += 1 if (letter_min..letter_max).cover?(letter_freq)
end

puts valid_passwords
