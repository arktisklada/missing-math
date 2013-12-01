module MissingMath

  module Integer
    # Returns boolean true|false if number is prime
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

    # Calculates a number's factorial
    def factorial
      throw "Not an Integer" if !self.is_i?
      self.downto(1).reduce(:*)
    end

    # Returns an array of a number's factors
    # @param boolean include_one To exclude the number 1 from the output, set to false
    def factors(include_one=true)
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

    # Converts an integer to an array of integers
    # Example: 12345.to_a => [1, 2, 3, 4, 5]
    def to_a
      self.to_s.split('').map {|n| n.to_i}
    end

    # Returns the character length of the number
    # Example: 12345.length => 5
    def length
      self.to_s.length
    end

    # Returns the number with a number added to the beginning of the number
    # @param integer n The number to prepend
    # Example: 2345.prepend(1) => 12345
    def prepend(n)
      "#{n}#{self}".to_i
    end

    # Returns the number with a number added to the end of the number
    # @param integer n The number to append
    # Example: 1234.append(5) => 12345
    def append(n)
      "#{self}#{n}".to_i
    end

    # Returns the number with the first digit removed from the beginning of the number
    # Similar to an Array#shift method
    # Example: 12345.shift => 2345
    def shift
      self.to_s[1..-1].to_i
    end

    # Returns the number with the last digit removed from the end of the number
    # Similar to an Array#pop method
    # Example: 12345.pop => 1234
    def pop
      self.to_s[0..-2].to_i
    end

    # Returns a digit subset/substring of the current number with a 0-indexed integer or range
    # @param integer|range index The substring index(es) to return
    # Similar to a String object's substring methods.
    # Example 1: 12345.substr(2) => 3
    # Example 2: 12345.substr(0..2) => 123
    def substr(index)
      self.to_s[index].to_i
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
      return a.join('').to_i
    end

    # Checks if the number contains a digit sequence or regex
    # @param integer|regexp n
    # Example 1: 12345.contains?(34) => true
    # Example 2: 12345.contains?(/34/) => true
    def contains?(n)
      if n.is_a? Regexp
        return self.to_s.scan(n).length > 0 ? true : false
      else
        return self.to_s.index(n.to_s) ? true : false
      end
    end
  end



  ### Module methods

  # Generates a prime sieve with max value n
  # @param integer n Max value of sieve
  # Example: MissingMath.esieve(1000) => [2, 3, 5, ...]
  def self.esieve(n)
    a = (0..n).to_a
    a[0] = nil
    a[1] = nil
    a.each do |i|
      next unless i
      break if i * i > n
      (i * i).step(n, i) { |m| a[m] = nil}
    end
    return a.compact
  end

end



require 'missing_math/integer'
require 'missing_math/float'
require 'missing_math/fixnum'
