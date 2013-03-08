# Refactoring Ruby
Jacob Morris
creativesoapbox.com
jacobmorris.net

jacob@creativesoapbox.com
twitter/github: @jacobsimeon

## Introduction

Start off with some coding horror stories

[Good Code][http://xkcd.com/844/]
![Quality Measurement](Desktop/6a0120a85dcdae970b012877707a45970c.png)

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

[ How do we write good tests? ]

> Good tests weather code refactorings with aplomb; they are written such that changes
> to the code do not force rewrites of the tests.
  \- Sandi Metz, *Practical Object-Oriented Design in Ruby: An Agile Primer*

> Incoming messages should be tested for the state they return. Outgoing command
> messages should be tested to ensure they get sent. Outgoing query messages should
> not be tested.  
  \- Sandi Metz

## Ruby

 - classes
 - blocks
 - Duck types
 - Metaprogramming

### Testing Ruby

  - use a test double to eliminate dependency on external object
  - use a mock to prove command messages
  - testing duck types using a module
    - prove an object fills a role
	- prove a test double implements the correct interface

## Examples

### Encapsulate Field

### Extract Method

### Replace conditional with polymorphism





  
