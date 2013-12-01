# Missing Math

This gem includes a variety of methods that I've used occasionally and felt they could be better served as object methods.

## Usage

Include the gem in an irb/console with

```ruby
require 'missing_math'
```

Or in your `Gemfile` with

```ruby
gem 'missing-math'
```

---

## General Methods

An `is_i?` method has been implemented on `Fixnum`, `Float`, and `Integer` classes to return a boolean true|false if the object is an integer.  This method is used by the `MissingMath` module to ensure proper data types before calcuations.  

A similar `is_f?` method has been implemented with the same concept, and returns boolean true|false if the object is a float.


### Integer Methods

- `prime?` Returns boolean true|false if number is prime
- `factorial` Returns a number's factorial n!
- `factors(true)` Returns an array of a number's factors
  - Takes one boolean param to include the number 1 in the output.  Default true, set to false to exclude
- `to_a` Converts an integer to an array of integers
  - Example: 12345.to_a => [1, 2, 3, 4, 5]
- `length` Returns the character length of the number
  - Example: 12345.length => 5
- `prepend(n)` Returns the number with a number added to the beginning of the number
  - Example: 2345.prepend(1) => 12345
- `append(n)` Returns the number with a number added to the end of the number
  - Example: 1234.append(5) => 12345
- `shift` Returns the number with the first digit removed from the beginning of the number
  - Example: 12345.shift => 2345
- `pop` Returns the number with the last digit removed from the end of the number
  - Example: 12345.pop => 1234
- `substr(index)` Returns a digit subset/substring of the current with a 0-indexed integer or range
  - Example 1: 12345.substr(2) => 3
  - Example 2: 12345.substr(0..2) => 123
- `rotate(true)` Returns the number with the first digit moved to the end
  - Example 1: 12345.rotate => 23451
  - Example 2: 12345.rotate(false) => 51234
- `contains?(n)` Checks if the number contains a digit sequence or regex
  - Example 1: 12345.contains?(34) => true
  - Example 2: 12345.contains?(/34/) => true


### Module Methods

- `esieve(n)` Generates a prime sieve with max value n
  - Example: MissingMath.esieve(1000) => [2, 3, 5, ...]



-----

## Contributing

Contributions welcome!  This is just something I've been putting together while doing code challenges, data operations, Project Euler, etc.

- I'd like to explore different algorithms for efficiency
- Debugging and exception handling
- Features!

In traditional GitHub style:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

