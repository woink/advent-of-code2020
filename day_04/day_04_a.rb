passports = ARGF.read.split(/\n\n/).map { |passport| passport.tr("\n", ' ') }

valid_passports = 0

passports.each do |passport|
  passport = passport.split.to_h { |record| record.split(':') }
  valid_passports += 1 if passport.size == 8 || (passport.length == 7 && !passport.key?('cid'))
end

puts valid_passports
