# Closures

Closures are hard, but they are so powerful that you will see them over and over
again in Swift.

Closures are self-contained blocks of functionality that can be passed around
and used in your code.

They are similar to functions, but have the ability to capture and store
references to variables and constants from the surrounding context in which they
are defined.

This makes them extremely powerful and versatile. In Swift, closures are
first-class citizens, meaning they can be passed as parameters, returned from
functions, and assigned to variables.

## Simple Example

Let's start with a simple example to understand the basics of closures. You can
test this in a Playground.

```swift
// A simple closure that takes no parameters and returns nothing.
let greetPerson: () -> Void = {
    print("Hello, World!")
}

// Execute the closure
greetPerson()
```

## More Advanced Example

For a more advanced example, let's use the free Jokes API to fetch a joke using
a closure.

This example will be well-commented to help you understand each step.

```swift
import Foundation

// Define a typealias for our closure.
// JokeClosure is a function that takes an optional String and an optional Error as parameters.
typealias JokeClosure = (String?, Error?) -> Void

// Function to fetch a joke using a closure.
func fetchJoke(completion: @escaping JokeClosure) {
    // @escaping means the closure can outlive the function call.
    
    // Construct the URL for the joke API.
    let urlString = "https://official-joke-api.appspot.com/random_joke"
    guard let url = URL(string: urlString) else {
        completion(nil, NSError(domain: "Invalid URL", code: 400, userInfo: nil))
        return
    }
    
    // Create a URLSession data task.
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            completion(nil, error)
            return
        }
        
        if let data = data, let jokeJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let joke = jokeJSON["setup"] as? String, let punchline = jokeJSON["punchline"] as? String {
            completion("\(joke) - \(punchline)", nil)
        } else {
            completion(nil, NSError(domain: "Invalid data", code: 500, userInfo: nil))
        }
    }
    
    // Start the data task.
    task.resume()
}

// Usage
fetchJoke { (joke, error) in
    if let joke = joke {
        print("Joke: \(joke)")
    } else if let error = error {
        print("Error: \(error)")
    }
}
```

## Resources
- [Closures: Official docs](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/)
- [Closures: Hacking with Swift](https://www.hackingwithswift.com/read/0/21/closures)


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fclosures.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fclosures.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fclosures.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fclosures.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fclosures.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
