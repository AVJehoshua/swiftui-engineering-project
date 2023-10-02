# Adding Packages in Xcode using Swift Package Manager (SPM)

Swift Package Manager is a dependency manager built into Xcode that allows you
to add third-party libraries and frameworks to your projects easily.

## The Basics of SPM in Xcode

Swift Package Manager is integrated into Xcode, so you don't need to install any
additional software.

It manages the download, update, and integration of external Swift packages
right within your Xcode environment.

## Steps to Add a Package

To add a package to your Xcode project, follow these steps:

1. Open Your Project: Launch Xcode and open the project where you want to add
   the package.

2. Navigate to SPM: Go to File > Add packages... (note that this may be slightly
   different depending on your version of Xcode).

3. Enter Repository URL: You'll be prompted to enter the URL of the package
   repository. Paste it and click Next.

4. Choose Version: You can specify the version rules for the package. Once done,
   click Next.

5. Select Target: Choose the target (your main app, unit tests or UI tests)
   where you want to add this package and click Finish.

The package is now added to your project.

## How Do I Know It's Working?

After installing it, you should be able to see it under 'Package Dependencies',
on the left side pane of Xcode (at the bottom, right below your Mobile App
targets).


## Troubleshooting Common Issues

- Package Not Found: Make sure the repository URL is correct.
- Version Conflicts: Ensure that the package version is compatible with your
  project settings.
- Build Errors: Sometimes, you may need to clean the build folder (Shift +
  Command + K) and rebuild the project.

## Resources

- [Swift Package Manager GitHub Repository](https://github.com/apple/swift-package-manager)


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fadding_new_packages_using_spm.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fadding_new_packages_using_spm.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fadding_new_packages_using_spm.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fadding_new_packages_using_spm.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fswiftui-engineering-project&prefill_File=pills%2Fadding_new_packages_using_spm.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
