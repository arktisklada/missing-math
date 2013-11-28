module MissingMath

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

  def factorial
    throw "Not an Integer" if !self.is_i?
    self.downto(1).reduce(:*)
  end

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

end


require 'missing_math/integer'
require 'missing_math/float'
require 'missing_math/fixnum'
