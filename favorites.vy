# pragma version 0.4.0
# @license MIT

# favorite things list:
# favorite numbers
# favorite peoples with their favorite numbers

# Data Types: Boolean, Signed Integer, Unsigned integer, Decimals, Address, Arrays, Byte Arrays, Strings.

# if we don't initiliaze the variable with the any keyword then the variable will only be visible to internal
# visibility keywords: internal, external, public
my_favorite_number: public(uint256) #0

list_of_numbers: public(uint256[5]) #[0,0,0,0,0]
index: public(uint256)

struct Person:
    favorite_number: uint256
    name: String[100]

my_name: public(String[100])
list_of_people: public(Person[5])

name_to_favorite_number: public(HashMap[String[100], uint256])
# Mariah, 30

#Constructor
@deploy
def __init__():
    self.my_favorite_number = 7
    self.index = 0
    self.my_name = "Patrick!"

@external
def store(new_number: uint256): 
    self.my_favorite_number = new_number

# a view function can be called
# by a human for free - no gas

# but when a transaction calls
# a view function, it costs gas

# by specifying arrow this will say that this function will return uiint256
@external
@view #by using view the contract does not use gas and only behave like to view the information about the variable or function
def retrieve() -> uint256:
    return self.my_favorite_number

@external
def add_person(name: String[100], favorite_number: uint256):
    # Add favorite number to the numbers list
    self.list_of_numbers[self.index] = favorite_number

    # Add the person to the person's list
    new_person: Person = Person(favorite_number = favorite_number, name = name)
    self.list_of_people[self.index] = new_person

    # Add the person to the hashmap
    self.name_to_favorite_number[name] = favorite_number
    
    self.index = self.index + 1