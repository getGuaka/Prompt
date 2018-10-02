# Prompt [![Build Status](https://travis-ci.com/getGuaka/Prompt.svg?branch=master)](https://travis-ci.com/getGuaka/Prompt)

Prompts the user for more information.

## Usage

### Ask
Ask presents the user with a prompt and waits for the user input.
```swift
let userName = ask("Enter user name?")
```
`userName` will contain the name entered by the user

Ask can be used to ask for value of Int, Double or Float types, to ask for an integer for example:

```swift
let age = ask("How old are you?", type: Int.self)
```
If the user prints something thats not convertible to integer, a new prompt is displayed to him, this prompt will keep displaying until the user enters an Int:

    How old are you?
    None
    You must enter a valid Integer.
    ?  Error
    You must enter a valid Integer.
    ?  5
    5

Validations are added by calling `addInvalidCase` on `AskSettings`.

```swift
let name = ask("Who are you?") { settings in
    settings.addInvalidCase("Snuffles is not allowed") { value in
        value.containsString("Snuffles")
    }
}
```
If the user entered `Snuffles` ask will keep displaying the invalid message passed to `addInvalidCase`

    Who are you?
    Snuffles
    Snuffles is not allowed
    ?  Snuffles
    Snuffles is not allowed
    ?  Snowball

    Your name is Snowball

`AskSettings.confirm` will ask the user to confirm his choice after entering it

```swift
let name = ask("Who are you?") { settings in
    settings.confirm = true
}
```

The above will output:

    Who are you?
    Snuffles
    Are you sure?  YES

    Your name is Snuffles

### Choose
Choose is used to prompt the user to select an item between several possible items.

To display a choice of programming lanaugage for example:
```swift
let choice = choose("Whats your favorite programming language? ",
    choices: "Swift", "Objective C", "Ruby", "Python", "Java :S")
```

This will print:

    1. Swift
    2. Objective C
    3. Ruby
    4. Python
    5. Java :S
    Whats your favorite programming language?

The user can either choose the numbers (1..5) or the item itself. If the user enters a wrong input. A prompt will keep showing until the user makes a correct choice

    Whats your favorite programming language? JavaScript
    You must choose one of [1, 2, 3, 4, 5, Swift, Objective C, Ruby, Python, Java :S].
    ?  BBB
    You must choose one of [1, 2, 3, 4, 5, Swift, Objective C, Ruby, Python, Java :S].
    ?  Swift

    You selected Swift, good choice!

You can customize the return value for each choice element. For example if you want to get an Int from the choice, you would do this

```swift
let choice = choose("Whats your favorite programming language? ", type: Int.self) { settings in
    settings.addChoice("Swift") { 42 }
    settings.addChoice("Objective C") { 20 }
}
```

The number on the left can be changed to letters, here is how you could do that:

```siwft
let choice = choose("Whats your favorite programming language? ", type: String.self) { settings in
   //choice value will be set to GOOD
   settings.addChoice("Swift") { "GOOD" }

   //choice value will be set to BAD
   settings.addChoice("Java") { "BAD" }

   settings.index = .Letters
   settings.indexSuffix = " ----> "
   }
```

That will print:

    a ----> Swift
    b ----> Java
    Whats your favorite programming language?

### Agree
Agree is used to ask a user for a Yes/No question. It returns a boolean representing the user input.

```swift
let choice = agree("Are you sure you want to `rm -rf /` ?")
```

If the user enters any invalid input, agree will keep prompting him for a Yes/No question

    Are you sure you want to `rm -rf /` ?  What!
    Please enter "yes" or "no".
    Are you sure you want to `rm -rf /` ?  Wait
    Please enter "yes" or "no".
    Are you sure you want to `rm -rf /` ?  No

    You entered false

## Installation

### Swift Package Manager

```swift
.package(url: "https://github.com/getGuaka/Prompt.git", from: "0.0.0"),
```

## License

MIT
