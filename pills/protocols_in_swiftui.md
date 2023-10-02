# Protocols in SwiftUI

Protocols are a powerful feature in Swift that enable you to define a blueprint
of methods, properties, and other requirements.

They are especially useful in SwiftUI for creating reusable and testable code.

## Why Protocols?

1. **Code Reusability**: Define a set of functionalities once and use them in
   multiple classes.
2. **Flexibility**: Easily swap out implementations without changing the rest of
   your code.
3. **Testability**: Mock services for testing by conforming to the same
   protocols as your production services.

## Basic Syntax

Here's a simple example of a protocol and a class that conforms to it:

```swift
protocol Animal {
    func makeSound() -> String
}

class Dog: Animal {
    func makeSound() -> String {
        return "Woof!"
    }
}
```

## Protocols in Your Project

Let's imagine we have a `SignUpPageView` swift file.

We then need to inject an `APIService` (responsible for communicating with the
backend) and a `CloudinaryService` (responsible for handling interactions with
Cloudinary), we then use protocols for `apiService` and `cloudinaryService`.

```swift
var apiService: APIServiceProtocol
var cloudinaryService: CloudinaryServiceProtocol
```


### Why Not Directly Use `APIService` or `CloudinaryService`?

What if we were to do this instead of the above?

```swift
var apiService: APIService
var cloudinaryService: CloudinaryService
```

🚨 Spoiler Alert 🚨

The use of protocols here is rooted in the Dependency Inversion Principle, one
of the SOLID principles of object-oriented design.

By using `APIServiceProtocol` and `CloudinaryServiceProtocol` instead of
`APIService` or `CloudinaryService`, you make your code:

- **Flexible**: Easily switch between different implementations (e.g., a mock
  service for testing).
- **Testable**: Write unit tests without relying on the actual services.
- **Decoupled**: Changes in the service implementation won't affect the rest of
  your code.
- **Reusable**: Use the same protocol in multiple views or even different
  projects.

In your `ContextView`, if you were to use `APIService` directly, it would indeed
complain because you're using a Mock for testing, which wouldn't be possible
without protocols.



## Your Task

One of your tasks this week is to identify areas in your project where protocols
could be beneficial.

Try implementing a new feature using protocols and see how it affects your
code's flexibility and testability.

## Summary

Protocols are a cornerstone of Swift programming, offering a range of benefits
from code reusability to testability. Understanding how to effectively use
protocols can significantly elevate your SwiftUI skills.

## Resources

- [Apple Official Documentation: Protocols](https://developer.apple.com/documentation/swift/adopting-common-protocols)
- [Hacking with Swift: Introduction to Protocols](https://www.hackingwithswift.com/sixty/9/1/protocols)


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fprotocols_in_swiftui.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fprotocols_in_swiftui.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fprotocols_in_swiftui.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fprotocols_in_swiftui.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fprotocols_in_swiftui.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
