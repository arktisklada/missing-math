module MissingMath
  # @esieve
  # @fib


  # Methods that can apply to all number object types
  module Number
    # Returns the number of digits in the number (if a float, decimal is excluded)
    # Example: 12345.length => 5
    def length
      str = self.to_s
      if str.index('.')
        str.length - 1
      elsif
        str.length
      end
    end

    # Returns the number with a number added to the beginning of the number
    # @param integer n The number to prepend
    # Example: 2345.prepend(1) => 12345
    def prepend(n)
      str = "#{n}#{self}"
      number_out(str)
    end

    # Returns the number with a number added to the end of the number
    # @param integer n The number to append
    # Example: 1234.append(5) => 12345
    def append(n)
      str = "#{self}#{n}"
      number_out(str)
    end

    # Returns the number with the first digit removed from the beginning of the number
    # Similar to an Array#shift method
    # Example: 12345.shift => 2345
    def shift
      str = self.to_s[1..-1]
      number_out(str)
    end

    # Returns the number with the last digit removed from the end of the number
    # Similar to an Array#pop method
    # Example: 12345.pop => 1234
    def pop
      str = self.to_s[0..-2]
      number_out(str)
    end

    # Returns a digit subset/substring of the current number with a 0-indexed integer or range
    # @param integer|range search The substring search to return
    # Similar to a String object's substring methods.
    # Example 1: 12345.substr(2) => 3
    # Example 2: 12345.substr(0..2) => 123
    def substr(search)
      str = self.to_s[search]
      number_out(str)
    end

    # Returns the number with the first digit moved to the end
    # @param boolean right Defaults to rotating right.  Set to false to rotate left
    # Example 1: 12345.rotate => 23451
    # Example 2: 12345.rotate(false) => 51234
    def rotate(right=true)
      a = self.to_a
      if right
        a.push(a.shift)
      elsif !right
        a.unshift(a.pop)
      end
      str = a.join('')
      number_out(str)
    end

    # Returns the number reversed
    # Example: 12345.reverse => 54321
    def reverse
      a = self.to_a
      str = a.reverse.join('')
      number_out(str)
    end

    # Returns true|false if the number is a palindrome
    # Example: 123454321.palindrome? => true
    def palindrome?
      return self == self.reverse
    end

    # Checks if the number contains a digit sequence or regex
    # @param integer|regexp search
    # Example 1: 12345.contains?(34) => true
    # Example 2: 12345.contains?(/34/) => true
    def contains?(search)
      if search.is_a? Regexp
        return self.to_s.scan(search).length > 0 ? true : false
      else
        return self.to_s.index(search.to_s) ? true : false
      end
    end

    # Converts an number to an array of numbers.  If a decimal number, the decimal will be a position in the array
    # Example: 12345.to_a => [1, 2, 3, 4, 5]
    def to_a
      self.to_s.split('').map do |n|
        matches = n.scan(/[0-9]/).length
        if matches > 0
          n.to_i
        else
          n
        end
      end
    end


    private

    # Output a stringed version of a number as a float or integer (whichever it deserves)
    def number_out(str)
      i = str.to_i
      f = str.to_f
      if i == f
        return i
      else
        return f
      end
    end
  end



  # Methods that apply to integers
  module Integer
    # Returns boolean true|false if integer is prime
    def prime?
      throw "Not an Integer" if !self.is_i?
      begin
        last = Math.sqrt(self).floor
        i = 2
        while i <= last
          if self % i == 0
            return false
          end
          i += 1
        end
        return true
      rescue
        false
      end
    end

    # Calculates an integer's factorial
    def factorial
      throw "Not an Integer" if !self.is_i?
      self.downto(1).reduce(:*)
    end

    # Returns an array of an integer's factors
    # @param boolean include_one Default is to exclude the number 1 from the output; to include set to false
    def factors(include_one=false)
      throw "Not an Integer" if !self.is_i?
      last = self
      i = include_one ? 1 : 2
      a = []
      while i < last
        if self % i == 0
          last = self / i
          a << i
          a << last
        end
        i += 1
      end
      return a.sort
    end

    # Returns an array of the integer's prime factors
    # @param boolean force_new Force new module variable @esieve generation.  Default uses module variable @esieve if it hasn't been set
    def prime_factors(force_new=false)
      ceil = (self / 2).ceil
      primes = MissingMath.esieve(ceil, force_new)
      factors = primes.collect { |i| i if self % i == 0 && i <= ceil }
      return factors.compact.uniq
    end


    # Returns the triangle number
    def triangle
      return (self * (self + 1)) / 2
    end

    # Returns the triangle number
    def pentagon
      return (self * ((3 * self) - 1)) / 2
    end

    # Returns the triangle number
    def hexagon
      return self * ((2 * self) - 1)
    end


    # Checks if the number is triangular.  If true, returns the number, otherwise false
    def triangular?
      n = (Math.sqrt((8 * self) + 1) - 1) / 2
      if n.floor == n.ceil
        return n
      else
        return false
      end
    end

    # Checks if the number is pentagonal.  If true, returns the number, otherwise false
    def pentagonal?
      n = (Math.sqrt((24 * self) + 1) + 1) / 6
      if n.floor == n.ceil
        return n
      else
        return false
      end
    end

  end



  ### Module methods

  # Generates a prime sieve with max value n
  # @param integer n Max value of sieve
  # @param boolean force_new Force new module variable @esieve generation.  Default uses module variable @esieve if it hasn't been set
  # Example: MissingMath.esieve(1000) => [2, 3, 5, ...]
  def self.esieve(n, force_new=false)
    if !@esieve || force_new
      a = (0..n).to_a
      a[0] = nil
      a[1] = nil
      a.each do |i|
        next unless i
        break if i * i > n
        (i * i).step(n, i) { |m| a[m] = nil}
      end
      @esieve = a.compact
    end
    return @esieve
  end

  # Generates an array holding an n-length fibonacci sequence
  # @param integer n Length of sequence to generate
  # @param boolean true_fib Use the true fibonacci sequence (0, 1, 1, 2...) or skip the first two values (1, 2, 3, 5...). Default true
  # @param boolean force_new Force new module variable @fib generation.  Default uses module variable @fib if it hasn't been set
  # Example: MissingMath.fibonacci(5) => [0, 1, 1, 2, 3]
  def self.fibonacci(n, true_fib=true, force_new=false)
    if !@fib || force_new
      @fib = true_fib ? [0, 1] : [1, 2]
      while @fib.length < n
        @fib << @fib[-1] + @fib[-2]
      end
    end
    return @fib
  end

end



require 'missing_math/integer'
require 'missing_math/float'
require 'missing_math/fixnum'
