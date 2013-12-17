class Float
  include MissingMath::Number
  include MissingMath::Nonspecific


  def is_i?
    false
  end

  def is_f?
    true
  end

end
