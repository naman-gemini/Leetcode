# @param {String} ip
# @return {String}
def valid_ip_address(ip)
  return "IPv4" if ip_v4?(ip)
  return "IPv6" if ip_v6?(ip)
  "Neither"
end

def ip_v4?(str)
  return false if str.count('.') != 3
  arr = str.split('.')
  return false if arr.size != 4
  return false if arr.any? { |t| t.empty? }
  # there should not be any leading zeroes
  return false if arr.any? { |t| t.size > 1 && t[0] == '0' }
  # each character should be numeral
  return false if arr.any? { |t| t.chars.any? { |char| !(char =~ /[0-9]/) } }
  # each number should be from 0 to 255
  arr.all? { |t| t.to_i >= 0 && t.to_i <= 255 }
end

def ip_v6?(str)
  return false if str.count(':') != 7
  arr = str.split(':')
  return false if arr.size != 8
  return false if arr.any? { |t| t.empty? }
  # any number should not have more than 4 characters
  return false if arr.any? { |t| t.size > 4 }
  # each character in all numbers should be in hexa decimal system
  arr.all? { |t| t.chars.all? { |char| char =~ /^[0-9a-fA-F]+$/ } }
end

# puts valid_ip_address("02001:0db8:85a3:0000:0000:8a2e:0370:7334")
