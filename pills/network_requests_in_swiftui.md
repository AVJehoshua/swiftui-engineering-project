# Network Requests in SwiftUI

Networking is the backbone of most modern apps, allowing them to interact with
APIs, databases, and other services.

This week, we'll dive into how to make network requests in SwiftUI using native
Apple libraries.

## Why Network Requests?

1. **Data Fetching**: Retrieve up-to-date information from APIs or databases.
2. **User Interaction**: Enable features like user authentication, likes, and
   comments.
3. **Dynamic Content**: Keep your app fresh and engaging by loading new content.

## The Basics: URL and `URLRequest`

Before making any network request, you'll need to understand two key classes:

1. **URL**: Represents a URL string and helps you manipulate it.
2. **URLRequest**: Encapsulates all data for an HTTP request (method, headers,
   body, etc.).

Here's a simple example using `URL`:

```swift
if let url = URL(string: "https://api.example.com/data") {
    print("Valid URL: \(url)")
} else {
    print("Invalid URL")
}
```

## Making Requests with `URLSession`

`URLSession` is the workhorse for network operations in SwiftUI. It's versatile
and works well with both `URL` and `URLRequest`.

### GET Request

Here's how to perform a basic GET request:

```swift
let url = URL(string: "https://api.example.com/data")!
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data {
        // Handle data
    }
}
task.resume()
```

### POST Request with `URLRequest`

For more complex requests like POST, you'll likely use `URLRequest`:

```swift
var request = URLRequest(url: URL(string: "https://api.example.com/data")!)
request.httpMethod = "POST"
request.httpBody = "key=value".data(using: .utf8)

let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    // Handle response here
}
task.resume()
```

## Decoding JSON with `Codable`

Swift's `Codable` protocol makes it easy to decode JSON data into Swift objects.

```swift
struct Item: Codable {
    var id: Int
    var name: String
}

if let data = data {
    let decoder = JSONDecoder()
    if let items = try? decoder.decode([Item].self, from: data) {
        // Use 'items' here
    }
}
```

## Your Task

Your task for this week is to integrate network requests into your app.

Fetch some data from an API and display it in your SwiftUI app. Think about how
you'll handle loading states, errors, and the UI updates that will be needed.

## Summary

Networking is crucial for any dynamic and interactive app.

By mastering `URL`, `URLRequest`, and `URLSession`, you're well on your way to
becoming a proficient SwiftUI developer.

## Resources

- [Apple Official Documentation: URLSession](https://developer.apple.com/documentation/foundation/urlsession)
- [Hacking with Swift: Sending and receiving Codable data with URLSession and SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui)


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fnetwork_requests_in_swiftui.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fnetwork_requests_in_swiftui.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fnetwork_requests_in_swiftui.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fnetwork_requests_in_swiftui.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fnetwork_requests_in_swiftui.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
