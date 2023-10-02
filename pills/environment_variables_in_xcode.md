# Environment Variables in Xcode

Environment variables are key-value pairs that can be used to configure
application settings.

They are particularly useful for storing sensitive information like API keys, or
for toggling between different configurations without changing the code.

In Xcode, you can set environment variables for your app through the scheme
settings.

## Why Use Environment Variables?

1. **Security**: Keep sensitive information like API keys out of your codebase.
2. **Flexibility**: Easily switch between different configurations (e.g.,
   development, staging, production).
3. **Maintainability**: Centralise configuration settings, making it easier to
   manage.

## How to Set Environment Variables in Xcode

1. **Open Your Project**: Open your Xcode project or workspace.
2. **Navigate to Scheme Settings**: Go to `Product` -> `Scheme` -> `Edit
   Scheme`.
3. **Select Run**: In the left sidebar, select `Run`.
4. **Environment Variables**: Go to the `Arguments` tab and you'll find a
   section for `Environment Variables`.
5. **Add Variable**: Click the `+` button to add a new environment variable.
   Enter the key and value.


## Accessing Environment Variables in Swift

You can access these variables in your Swift code using the `ProcessInfo` class.

```swift
if let apiKey = ProcessInfo.processInfo.environment["API_KEY"] {
    print("API Key is: \(apiKey)")
} else {
    print("API Key not found")
}
```

## Example: Using Environment Variables for API Configuration

Let's say you have a `JokeService` class that needs an API key. Instead of
hardcoding this key, you can set it as an environment variable.

1. **Set API Key in Xcode**: Add a new environment variable named
   `JOKE_API_KEY`.
2. **Access in `JokeService.swift`**:

```swift
class JokeService {
    let apiKey: String
    
    init() {
        if let apiKey = ProcessInfo.processInfo.environment["JOKE_API_KEY"] {
            self.apiKey = apiKey
        } else {
            fatalError("API Key not found")
        }
    }
    
    // rest of the code
}
```

<!-- OMITTED -->

## Summary

Environment variables offer a secure and flexible way to manage your app's
configuration.

They are easy to set up in Xcode and can be accessed in Swift using the
`ProcessInfo` class. As you work on your projects, consider using environment
variables to manage API keys, URLs, and other configuration settings.

## Resources
- [Using Environment Variables in Swift apps](https://www.swiftdevjournal.com/using-environment-variables-in-swift-apps/)


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fenvironment_variables_in_xcode.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fenvironment_variables_in_xcode.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fenvironment_variables_in_xcode.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fenvironment_variables_in_xcode.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fenvironment_variables_in_xcode.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
