vals = File.readlines('input.txt')

valid_passwords = 0

vals.each do |val|
  val_split = val.split(/ /)
  letter_min, letter_max = val_split[0].split(/-/).map(&:to_i)
  given_letter = val_split[1][0]
  password = val_split[2]

  if (password[letter_min - 1] == given_letter) && (password[letter_max - 1] != given_letter)
    valid_passwords += 1
  elsif (password[letter_min - 1] != given_letter) && (password[letter_max - 1] == given_letter)
    valid_passwords += 1
  end
end

puts valid_passwords
