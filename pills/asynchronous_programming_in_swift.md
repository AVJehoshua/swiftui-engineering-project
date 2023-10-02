# Asynchronous Programming in Swift

Before Swift introduced native asynchronous programming features, developers
often used callbacks, delegation, and third-party libraries like `PromiseKit` to
handle asynchronous operations.

## An example of Async operations using callbacks

In programming, a callback is a piece of executable code that is passed as an
argument to other code.

The idea is that the other code will execute this passed-in block of code at a
given time.

This mechanism allows you to have more control over the flow of a program,
especially in asynchronous operations like API calls.

Callbacks are often used to continue code execution after an asynchronous
operation has completed.

*In Swift, callbacks are commonly implemented using closures.*


```swift
import Foundation

// Define a typealias for our callback function.
// JokeCallback is a function that takes an optional String and an optional Error as parameters.
typealias JokeCallback = (String?, Error?) -> Void

// Function to fetch a joke.
// The function takes a completion block as a parameter.
func fetchJoke(completion: @escaping JokeCallback) {
    // @escaping means the closure can outlive the function call.
    
    // Construct the URL for the joke API.
    let urlString = "https://official-joke-api.appspot.com/random_joke"
    guard let url = URL(string: urlString) else {
        // If the URL is invalid, call the completion block with an error.
        completion(nil, NSError(domain: "Invalid URL", code: 400, userInfo: nil))
        return
    }
    
    // Create a URLSession data task to fetch data from the URL.
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        // This block is executed once the data is fetched.
        
        // Check if there was an error in the data task.
        if let error = error {
            // Call the completion block with the error.
            completion(nil, error)
            return
        }
        
        // Parse the fetched data to a String.
        if let data = data, let jokeJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let joke = jokeJSON["setup"] as? String, let punchline = jokeJSON["punchline"] as? String {
            // Call the completion block with the joke.
            completion("\(joke) - \(punchline)", nil)
        } else {
            // If data parsing fails, call the completion block with an error.
            completion(nil, NSError(domain: "Invalid data", code: 500, userInfo: nil))
        }
    }
    
    // Start the data task.
    task.resume()
}

// Usage of fetchJoke function.
// The JokeCallback is passed here as a closure.
fetchJoke { (joke, error) in
    // This block is the completion block (JokeCallback).
    
    if let joke = joke {
        print("Joke: \(joke)")
    } else if let error = error {
        print("Error: \(error)")
    }
}
```

## The same example using async/await

Async/Await is a modern approach to handle asynchronous operations, and it's
designed to make your code cleaner (you can see it's also considerable shorter
in length) and more intuitive.

Unlike callbacks, which can lead to "callback hell" due to nesting, Async/Await
offers a way to write asynchronous code that looks almost like traditional
synchronous code.

The `async` keyword marks a function as asynchronous, meaning it can perform
work in the background, and the `await` keyword is used to wait for the
completion of an `async` function.

This makes the code easier to read and maintain.

```swift
import Foundation

// Function to fetch a joke using async/await.
// The function is marked as 'async' to indicate it's asynchronous.
func fetchJokeAsync() async throws -> String {
    // Construct the URL for the joke API.
    let urlString = "https://official-joke-api.appspot.com/random_joke"
    guard let url = URL(string: urlString) else {
        // Throw an error if the URL is invalid.
        throw NSError(domain: "Invalid URL", code: 400, userInfo: nil)
    }
    
    // Fetch the data using URLSession's async method.
    // 'await' means the function will wait for the data to be fetched.
    let (data, _) = try await URLSession.shared.data(from: url)
    
    // Parse the fetched data to a String.
    guard let jokeJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
          let joke = jokeJSON["setup"] as? String, let punchline = jokeJSON["punchline"] as? String else {
        // Throw an error if data parsing fails.
        throw NSError(domain: "Invalid data", code: 500, userInfo: nil)
    }
    
    // Return the parsed joke.
    return "\(joke) - \(punchline)"
}

// Usage of fetchJokeAsync function.
// We use a Task to run async functions.
Task {
    do {
        // 'await' means we wait for the function to complete and return a value.
        let joke = try await fetchJokeAsync()
        print("Joke: \(joke)")
    } catch {
        // Catch any errors thrown by the async function.
        print("Error: \(error)")
    }
}
```

## Resources

- [Hacking with Swift: Async await](https://www.hackingwithswift.com/swift/5.5/async-await)


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fasynchronous_programming_in_swift.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fasynchronous_programming_in_swift.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fasynchronous_programming_in_swift.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fasynchronous_programming_in_swift.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fasynchronous_programming_in_swift.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
