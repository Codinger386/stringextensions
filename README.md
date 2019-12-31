# StringExtensions

Some simple `String` extensions.

## Upper- and lower-casing the first letter

`public func uppercasedFirstLetter() -> String`

`public mutating func upercaseFirstLetter()`

`public func lowercasedFirstLetter() -> String`

`public mutating func lowercaseFirstLetter()`

## Variable name cases

Use a simple function to transform strings into different variable name cases:

`public func transforming(from: VariableNameCase, to: VariableNameCase) -> String`

Supported cases are:

    * .words: "my super fancy variable name"
    * .lowerCamel: "mySuperFancyVariableName"
    * .upperCamel: "MySuperFancyVariableName"
    * .lowerSnake: "my_super_fancy_variable_name"
    * .upperSnake: "MY_SUPER_FANCY_VARIABLE_NAME"
    * .lowerKebab: "my-super-fancy-variable-name"
    * .upperKebab: "MY-SUPER-FANCY-VARIABLE-NAME"
    
