# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'missing_math/version'


Gem::Specification.new do |s|
  s.name          = 'missing-math'
  s.version       = MissingMath::VERSION
  s.authors       = ['Clayton Liggitt']
  s.email         = 'mail@enorganik.com'
  s.summary       = 'Missing Math!'
  s.description   = 'A library of missing math functions.'
  s.homepage      = 'https://github.com/arktisklada/missing-math'
  s.license       = 'MIT'

  s.files         = Dir.glob('lib/**/*.rb') #`git ls-files`.split($/) #['lib/missing_math.rb', 'lib/missing_math/integer.rb', 'lib/missing_math/float.rb', 'lib/missing_math/fixnum.rb']
  s.require_paths = ['lib'] #%w(lib)

end
