# Dependency Injection

Dependency Injection (DI) is a design pattern that allows us to create more
modular, testable, and maintainable code.

It's a technique where one object supplies the dependencies of another object,
rather than having them construct those dependencies themselves.

In the context of Swift and SwiftUI, Dependency Injection is often used to
provide services to views.

## Why Dependency Injection?

1. **Testability**: Easier to mock dependencies for unit tests.
2. **Reusability**: Components can be reused in different environments.
3. **Maintainability**: Easier to manage and refactor code.

## Types of Dependency Injection

1. **Constructor Injection**: Injecting the dependency through the constructor.
2. **Property Injection**: Injecting the dependency by setting a property.
3. **Method Injection**: Injecting the dependency using a method.

## Simple Example: Joke Service in SwiftUI

Let's consider a simple example where we have a `JokeService` that fetches a
joke from a free API.

We'll inject this service into a SwiftUI view to display the joke.

### JokeService.swift

```swift
import Foundation

class JokeService {
    func fetchJoke(completion: @escaping (String?) -> Void) {
        let url = URL(string: "https://official-joke-api.appspot.com/random_joke")!
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let setup = json["setup"] as? String,
               let punchline = json["punchline"] as? String {
                completion("\(setup) - \(punchline)")
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
```

### ContentView.swift

```swift
import SwiftUI

struct ContentView: View {
    let jokeService: JokeService
    @State private var joke: String = "Loading..."
    
    init(jokeService: JokeService) {
        self.jokeService = jokeService
    }
    
    var body: some View {
        Text(joke)
            .onAppear {
                jokeService.fetchJoke { fetchedJoke in
                    if let fetchedJoke = fetchedJoke {
                        self.joke = fetchedJoke
                    }
                }
            }
    }
}
```

### Using ContentView

```swift
let jokeService = JokeService()
let contentView = ContentView(jokeService: jokeService)
```

In this example, we inject the `JokeService` into `ContentView` via its
constructor. When the view appears, it uses the service to fetch a joke and
display it.

<!-- OMITTED -->

## Summary

Dependency Injection is a powerful design pattern that can make your code more
modular, testable, and maintainable.

As you work on your app this week, consider how you can use Dependency Injection
to manage services and other components that your views depend on.


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fdependency_injection.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fdependency_injection.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fdependency_injection.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fdependency_injection.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fdependency_injection.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
