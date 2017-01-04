def isPrime(num)
  # Vaildate that input is a number.
  if num.kind_of?(Comparable) && num.to_i.kind_of?(Numeric)
    num = num.to_i
  else
    return "This is not a number"
  end

  # Go through basic validations (2 & 3 are prime, anything less isn't, and numbers divisible by 2 or 3 aren't either).
  if num <= 1
    return false
  elsif num <= 3
    return true
  elsif num % 2 == 0 || num % 3 == 0
    return false
  end

  # Find the square root of the number, rounded up. This is used as an upper limit for the following loop.
  root = Math.sqrt(num).ceil
  i = 5

  # Starting at 5, check if this value is greater than the root...
  until i > root
    # If it's not, check if the number is divisible by this value. # If it is, return false.
    if num % i == 0
      return false
    end
    # If it is not, increment the value by 2 and repeat the process.
    i += 2
  end
  # If the incrementing value exceeds the square root of the number without the number being divisible by it, return true.
  return true
end

def findBeef(nth_prime)
  # Initialize a counter for prime numbers and the incrementing value.
  prime_count = 0
  i = 1
  # Loop until a value is returned.
  while true
    # If the number converted to hexidecimal contains "beef" and it's prime...
    if !!i.to_s(16)["beef"] && isPrime(i)
      # ...increment the prime counter. If that equals the prime we're looking for, return the value of the number itself.
      prime_count += 1
      if prime_count == nth_prime
        return i
      end
    end
    # Increment the value being tested and repeat.
    i += 1
  end
end

puts findBeef(444)