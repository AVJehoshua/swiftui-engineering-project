# Error Handling in Swift

Error handling is a fundamental practice in programming that allows you to deal
with unexpected situations or conditions in your code.

Swift provides first-class support for throwing, catching, propagating, and
manipulating recoverable errors at runtime.

## Why Error Handling?

1. **Robustness**: Makes your app more resilient by gracefully handling
   failures.
2. **User Experience**: Allows you to provide meaningful error messages to the
   user.
3. **Debugging**: Easier to debug issues when errors are properly categorised
   and handled.

## Basic Concepts

- **Throwing Errors**: Your functions can throw errors to indicate that they
  failed to perform an action.
- **Catching Errors**: A `do-catch` statement allows you to catch and handle
  errors gracefully.
- **Propagating Errors**: You can propagate errors from a function to the code
  that calls that function.

## Define an Error Type

First, define an error type that conforms to the `Error` protocol. This will
represent the errors that your function can throw.

```swift
enum JokeError: Error {
    case invalidURL
    case noData
    case parsingError
}
```

## Throwing Errors

Mark your function with the `throws` keyword to indicate that it can throw an
error.

```swift
func fetchJoke() throws -> String {
    // Your code here
    throw JokeError.invalidURL // Example of throwing an error
}
```

## Catching Errors

Use a `do-catch` statement to catch errors.

```swift
do {
    let joke = try fetchJoke()
    print("Joke: \(joke)")
} catch JokeError.invalidURL {
    print("Invalid URL.")
} catch JokeError.noData {
    print("No data received.")
} catch JokeError.parsingError {
    print("Failed to parse data.")
} catch {
    print("An unknown error occurred: \(error)")
}
```

## Propagating Errors

If you don't want to handle the error in the current function but want to let it
propagate to the calling function, use `throws` in your function signature.

```swift
func fetchJokeAndPrint() throws {
    let joke = try fetchJoke()
    print("Joke: \(joke)")
}
```

<!-- OMITTED -->

## Summary

Error handling in Swift is a powerful feature that helps you write robust code.

By understanding how to throw, catch, and propagate errors, you can build apps
that can gracefully handle unexpected situations, making your apps more reliable
and user-friendly.

## Resources

- [Hacking with Swift: How to handle errors in functions](https://www.hackingwithswift.com/quick-start/beginners/how-to-handle-errors-in-functions)


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Ferror_handling_in_swift.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Ferror_handling_in_swift.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Ferror_handling_in_swift.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Ferror_handling_in_swift.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Ferror_handling_in_swift.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
