# Missing Math

This gem includes a variety of methods that I've used occasionally and felt they could be better served as object methods.

---

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

### Fixnum, Float, and Integer classes

- An `is_i?` method has been implemented on `Fixnum`, `Float`, and `Integer` classes to return a boolean true|false if the object is an integer.  This method is used by the `MissingMath` module to ensure proper data types before calcuations.  
- A similar `is_f?` method has been implemented with the same concept, and returns boolean true|false if the object is a float.

### Array class

- `to_i` has been implemented on the `Array` class to join an array of numbers and return an integer

### Number Methods

- `length` Returns the character length of the number
  - Example: 12345.length => 5
- `to_a` Converts a number to an array of integers
  - Example: 12345.to_a => [1, 2, 3, 4, 5]
- `prepend(n)` Returns the number with a number added to the beginning of the number
  - Example: 2345.prepend(1) => 12345
- `append(n)` Returns the number with a number added to the end of the number
  - Example: 1234.append(5) => 12345
- `shift` Returns the number with the first character removed from the beginning of the number
  - Example: 12345.shift => 2345
- `pop` Returns the number with the last character removed from the end of the number
  - Example: 12345.pop => 1234
- `substr(search)` Returns a digit subset/substring of the current with a 0-indexed integer or range
  - Example 1: 12345.substr(2) => 3
  - Example 2: 12345.substr(0..2) => 123
- `contains?(search)` Checks if the number contains a sequence or regex
  - Example 1: 12345.contains?(34) => true
  - Example 2: 12345.contains?(/34/) => true
- `rotate(true)` Returns the number with the first digit moved to the end
  - Example 1: 12345.rotate => 23451
  - Example 2: 12345.rotate(false) => 51234
- `reverse` Reverses the number
  - Example: 12345.reverse => 54321
- `palindrome?` Checks if the number is a palindrome
  - Example: 123454321.palindrome? => true

### Integer Methods

- `prime?` Returns boolean true|false if integer is prime
- `factorial` Returns an integer's factorial n!
- `factors(false)` Returns an array of an integer's factors
  - Takes one boolean param to include 1 in the output.  Default false, set to true to include
- `prime_factors` Returns an array of the integer's prime factors
- `triangle` Calculates the triangle number
- `pentagon` Calculates the pentagonal number
- `hexagon` Calculates the hexagonal number
- `triangular?` Checks if the number is triangular.  If true, returns the number, otherwise false.
- `pentagonal?` Checks if the number is pentagonal.  If true, returns the number, otherwise false.

### Module Methods

- `esieve(n, force_new=false)` Generates a prime sieve with max value n
  - Calling this method creates a global module variable @esieve.  To force it to generate a new @sieve, set `force_new` to true
  - Example: MissingMath.esieve(1000) => [2, 3, 5, ...]
- `fibonacci(n, true_fib=true, force_new=false)` Generates an n-length fibonacci sequence
  - Calling this method creates a global module variable @esieve.  To force it to generate a new @sieve, set `force_new` to true
  - This method defaults to using the true fibonacci sequence (0, 1, 1, 2...).  To skip the first two values (1, 2, 3, 5...), set `true_fib` to false
  - Example: MissingMath.fibonacci(5) => [0, 1, 1, 2, 3]



-----

## Contributing

Contributions welcome!  This is just something I've been putting together while doing data operations, code challenges, Project Euler problems, etc.

- I'd like to explore different algorithms for efficiency
- Debugging and exception handling
- Features!

In traditional GitHub style:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

