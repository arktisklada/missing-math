class Integer
  include MissingMath::Number
  include MissingMath::Integer


  def is_i?
    return true
  end

  def is_f?
    return false
  end

end
