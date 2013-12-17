class Fixnum
  include MissingMath::Number
  include MissingMath::Nonspecific


  def is_i?
    super
  end

  def is_f?
    super
  end

end
