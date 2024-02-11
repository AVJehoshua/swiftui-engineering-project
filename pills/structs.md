# `Structs`

## Introduction

`Structs` are key building blocks in Swift programming, similar to classes in that they can both have properties and methods. However, a fundamental difference lies in how they are handled in memory: `structs` are known as **value types** while classes are **reference types**. This distinction affects how you design and work with your data in Swift, especially in a framework like SwiftUI.

<details>
  <summary>What does value type and reference type mean?</summary>

  Value types (like `structs`) are copied when they are passed around in your code, meaning each instance holds a unique copy of its data. In contrast, reference types (like class instances) are not copied; when passed around, they share a single copy of the data that they point to. Understanding this behavior is crucial for managing memory, mutability, and data flow in your applications.

</details>

Consider the following example to understand the difference:

```swift
struct Point {
    var x: Int
    var y: Int
}

var originalPoint = Point(x: 1, y: 2)
var copiedPoint = originalPoint // Creates a unique copy
copiedPoint.x = 3 // Only affects copiedPoint, originalPoint remains unchanged

class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}

var originalPerson = Person(name: "Josué")
var referencedPerson = originalPerson // References the same instance
referencedPerson.name = "Ana" // Changes reflected in both originalPerson and referencedPerson
```

## Why Use `Structs` Instead of Classes?

`Structs` are preferred for their immutability, performance efficiency, and simplicity, which make them ideal for representing models and UI components in SwiftUI. Using `structs` helps ensure thread-safe, predictable code, and aligns with SwiftUI's data-driven approach, where UI updates are triggered by changes in data models.

For example, in a SwiftUI to-do list app, each to-do item can be a struct with properties like `title`, `isCompleted`, and `dueDate`. This approach ensures that modifications to a to-do item in one part of the UI don't unexpectedly affect other parts, maintaining UI consistency and reducing bugs.

```swift
struct ToDoItem {
    var title: String
    var isCompleted: Bool
    var dueDate: Date
}

// SwiftUI view displaying the list
List(toDoItems) { item in
    Text(item.title)
    // UI is automatically updated when toDoItems change
}
```

## Exercise

Create a Book struct that includes `title`, `author`, and `publicationYear` properties, along with a method `summary` that returns a string summarising the book details.

It should behave as follows:

```swift
var book = Book(title: "Swift Fundamentals", author: "Josué", publicationYear: 2024)

print(book.summary())
// Expected output: "Swift Fundamentals by Josué, published in 2024."
```

## Challenge

Define a `MusicAlbum` struct that contains an array of Song structs. Each Song should have a title and duration. Implement methods in `MusicAlbum` to add a song and to calculate the total duration of the album.

It should work like this:

```swift
var album = MusicAlbum(name: "Swift Tunes")

album.addSong(title: "Variable Blues", duration: 3.15)
album.addSong(title: "Constant Heart", duration: 4.07)

print(album.totalDuration())
// Should print: "Total Duration: 7.22 minutes"
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fstructs.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fstructs.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fstructs.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fstructs.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fstructs.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
