vals = File.readlines("input.txt")

valid_passwords = 0

vals.each do |val|
  val_split = val.split(/ /)
  allowed_letter_freq = val_split[0].split(/-/)
  letter_min = allowed_letter_freq[0].to_i
  letter_max = allowed_letter_freq[1].to_i
  given_letter = val_split[1][0]
  password = val_split[2]
  letter_freq = password.count(given_letter)

  if (password[letter_min - 1] == given_letter) && (password[letter_max -1] != given_letter)
    valid_passwords += 1
  elsif (password[letter_min - 1] != given_letter) && (password[letter_max -1] == given_letter)
    valid_passwords += 1
  end
end

puts valid_passwords
