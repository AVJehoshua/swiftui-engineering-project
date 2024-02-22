//
//  photoview.swift
//  MobileAcebook
//
//  Created by Ilhan Abdalle on 22/02/2024.
//

import SwiftUI
import UniformTypeIdentifiers

struct ImageUploadView: View {
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    
    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                        .stroke(Color.white)
                    )
                    .frame(width: 160, height: 160)

                    .onTapGesture {
                            selectedImage = nil
                            isShowingImagePicker = true
                        }
                
                Button("Save Image") {
                              if let image = selectedImage {
                                  uploadImageFromPicker()
                              }
                          }
            } else {
                Image(systemName: "person.crop.circle.fill")
                .scaledToFit()
                .frame(width: 125, height: 160)
                .symbolRenderingMode(.hierarchical)
//                .symbolRenderingMode(.hierarchical)
//                .foregroundStyle(.blue)
//                .clipShape(Circle())
//                .overlay(
//                    Circle()
//                    .stroke(Color.white, lineWidth: 4)
//                )
                .frame(width: 125, height: 160)
                .onTapGesture {
                            isShowingImagePicker = true
                                        }
            }
        }
        .sheet(isPresented: $isShowingImagePicker, onDismiss: uploadImageFromPicker) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
        }
    }
    
    func uploadImageFromPicker() {
        if let image = selectedImage {
//            function to send image to back-end/ Cloudinary
            print("Uploaded image:", image.size)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var isPresented: Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No update needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.isPresented = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresented = false
        }
    }
}
