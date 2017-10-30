# Code Organization

## SOLID

### Single Responsibility Principle:

Each class should have only a single responsibility

* Game: responsible for setting the game in motion
* Player: responsible for taking player actions
* Day: responsible for determining what happens during the day (how many customers, what weather, which events)
* Where should lemonade recipe and reputation be maintained?

### Open Closed Principle:

A class should be open for extension , but closed for modification.

Should pass configuration data into new instances of the class rather than hardcoding in.

** Game -- should pass in number of days

### Liskov Substitution Principle:

The class should be able to call functions without caring about the type of the object.

### Interface Segregation Principle:

Clients should not be forced to depend upon interfaces that they do not use.

### Dependency Inversion Principle:

High level modules should not depend upon low level modules. Both should depend upon abstractions.

Abstractions should not depend upon details. Details should depend upon abstractions.