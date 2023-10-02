# Testing in Swift

From the previous module, you are already familiar with unit tests (you tested
FizzBuzz in Swift).

However, in SwiftUI apps, we are building user interfaces for Apple devices.
Another important type of test we have not covered so far is UI testing.

*The application you have been given this week comes with some working UI tests
for the Welcome Page View.*

## The flow in UI tests

The most important thing to know is that as part of UI tests, you are emulating
the user behaviour from the moment they launch your app.

This means you may need to perform actions such as: tapping on visual elements
of your app, navigating to other views, etc.

## What should our UI tests include for this app?

That's a great question! For this week, we are not going to focus on writing all
the UI test cases we can think of, as this may be really time consuming and we
have only one week.

Focus on covering these:
- Make sure you test that all the visual elements the user can interact with are
  present.
- As your app navigates the user to a different view, make sure you are not in
  the present view anymore.


## Okay, but then... How do I make sure that my mobile app is correctly integrated with other services? E.g. backend app, Cloud image service...

That's a fair question.

We suggest you use a combination of:

1. **Unit tests** (using mocks to simulate responses from then backend, Cloud,
   etc.)

E.g. If you want to test the authentication system of your Mobile App, instead
of using the real `AuthenticationService`, you could use a
`MockAuthenticationService`.

This way, you will simulate the backend responses and you won't be making real
(and unnecessary) network calls to the backend in your tests.

2. **Manual testing** via the Xcode simulator to make sure our app works as
   expected


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Ftesting_in_swift.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Ftesting_in_swift.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Ftesting_in_swift.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Ftesting_in_swift.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Ftesting_in_swift.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
