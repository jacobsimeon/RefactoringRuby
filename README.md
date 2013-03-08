# Refactoring Ruby
Jacob Morris  
creativesoapbox.com  
jacobmorris.net  

jacob@creativesoapbox.com  
twitter/github: @jacobsimeon

## Introduction

What is good code?
![Quality Measurement Image]

Good code does exactly what you would expect it to.

How do we write good code?
[Good Code][http://xkcd.com/844/]

Red. Green. Refactor.  
The first two give you an application that works, the last gives you quality.

## Refactoring

[ What is refactoring? ]

> Refactoring is the process of changing a software system in such a way that it does not
> alter the external behavior of the code yet improves the internal structure.

  \- Martin Fowler, *Refactoring : Improving the Design of Existing Code*

## Testing

[ Why do we need tests? ]

Red -> Green -> Refactor -> Green!

- Tests provide the specification
- Refactoring allows you to improve a design
- Running tests after the refactor ensure the specification is still met

### How/What to Test:

[ What constitutes a good test? ]

> Good tests weather code refactorings with aplomb; they are written such that changes
> to the code do not force rewrites of the tests.
  \- Sandi Metz, *Practical Object-Oriented Design in Ruby: An Agile Primer*

[ How do we write good tests? ]

> Incoming messages should be tested for the state they return. Outgoing command
> messages should be tested to ensure they get sent. Outgoing query messages should
> not be tested.
  \- Sandi Metz

--------

## Ruby

[The Ruby Language][http://www.ruby-lang.org/en/about/]

### Everything is an object

Numbers are objects

```
3.even? # => fase
```

Strings are objects

```
“hello world”.sub /hello/, “HELLO” # => “HELLO world”
```

Even classes are objects

``` ruby
Fixnum.superclass # => Integer
Fixnum.superclass.superclass # => Numeric
Fixnum.superclass.superclass.superclass # => Object
```

### Object Oriented

Ruby is object-oriented.

``` ruby
class Person
  attr_accessor :name

  def initalize(name)
    @name = name
  end
end

Person.new(“Jacob”).name
# => “Jacob”
```

In ruby, you can re-open or "monkey patch" classes

``` ruby
class String
  def to_valley_speak
    "like, #{self}"
  end
end

"hello world".to_valley_speak
# => "like, hello world"
```

### Blocks

Ruby is functional.

All methods implicitly accept blocks, which are pieces of code that can be
evaluated by the method being called.

Array#map accepts a block and creates another array with the result of each
expression

``` ruby
[1, 2, 3].map { |i| 100 + i }

# => [101, 102, 103]
```

### "Duck" types

Ruby is dynamically typed.
If an object looks like a duck, walks like a duck and quacks like a duck, then
it's a duck.

``` ruby
class Duck
  def speak; "quack" end
end

class Dog
  def speak; "bark" end
end

def poke(animal)
  puts animal.speak
end

poke(Duck.new)
# => "quack"

poke(Dog.new)
# => "bark"

```

> Often people, especially computer engineers, focus on the machines. They think,
> "By doing this, the machine will run faster. By doing this, the machine will
> run more effectively. By doing this, the machine will something something
> something." They are focusing on machines. But in fact we need to focus on
> humans, on how humans care about doing programming or operating the
> application of the machines. We are the masters. They are the slaves.

\- Yukihiro Matsumoto (Matz), creator of ruby

### Testing Ruby

#### Test Doubles
 - Eliminate coupling to potentially expensive
 operations by using test doubles.

#### Mocks
 - Verify objects recieve the correct *commands*

#### Testing Duck Types
 - Use Interface tests
 - Include them in your mocks

--------

## Examples

### Encapsulate Field

### Extract Method

### Replace conditional with polymorphism

### Composition over inheritance

