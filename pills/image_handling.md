# Image Handling in Swift

Handling images is a common requirement in many apps, whether it's a social
media platform, a photo editing tool, or a game.

For the project this week, we are going to use Cloudinary to upload and download
images, and therefore we'll also need to select existing images from the iOS
device we're running the app on.


## Why Image Handling?

1. **User Experience**: Allows users to personalise their experience, like
   setting profile pictures or sharing photos.
2. **Data Management**: Efficiently manage and display images from various
   sources.
3. **Interactivity**: Adds an interactive layer to your app, enhancing user
   engagement.


## Picking Images: `UIImagePickerController` vs `PHPickerViewController`

Before we jump into the code, let's understand the two primary ways to pick
images in iOS:

1. **UIImagePickerController**: Older but highly customisable. Part of UIKit.
2. **PHPickerViewController**: Modern, privacy-focused, and designed for
   SwiftUI.

### `UIImagePickerController` in SwiftUI

Here's how you can use `UIImagePickerController` in a SwiftUI project. This
method is highly customisable but a bit verbose.

```swift
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var imageName: String

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No-op => Short for "No Operation", to indicate to devs that nothing should go here
        // This is needed to conform to the protocol for this struct
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage  // Update the image
                
                if let url = info[.imageURL] as? URL {
                    parent.imageName = url.lastPathComponent  // Update the file name
                }
            }

            picker.dismiss(animated: true)
        }
    }
}
```

### `PHPickerViewController` in SwiftUI

If you're targeting iOS 14 and above and preferred a more straightforward
approach, use `PHPickerViewController`.

```swift
import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider else { return }

            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
}
```

## How you will handle images in your app

As part of your implementation for this week's project, you will have to
integrate an `ImagePicker` so that the user can select an existing image from
the device gallery.

Once selected, it will live in the state of the SwiftUI app.

Then, finally, you can think about how to upload it to Cloudinary (or any other
Cloud provider really!).

**And what about when we need to display them in posts?**

Well, the process here is the opposite, you will have to think first about how
you download the images, and then how you display them in the app :)



## Summary

Image handling is an essential skill for iOS development.

By integrating functionalities like image picking from the device and image
uploading/downloading via Cloudinary, you can significantly enhance the
capabilities and user experience of your app.

## Resources

- [Hacking with Swift: Importing an image into SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/importing-an-image-into-swiftui-using-phpickerviewcontroller)


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fimage_handling.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fimage_handling.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fimage_handling.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fimage_handling.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fimage_handling.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
