require 'test/unit'
extend Test::Unit::Assertions

def function(a, b)
  a + b
end

assert_equal(function(10, 2), 12)
assert_equal(function(20, 6), 14)