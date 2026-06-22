//
//  AvatarPickerView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 22/6/26.
//

import SwiftUI
import PhotosUI

struct AvatarPickerView: View {
    var size: CGFloat = AppConstants.avatarSize
    var borderColor: Color = AppColor.shared.border
    
    @Binding var image: UIImage?
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()
        ) {
            Group {
                if let image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                } else {
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(borderColor, lineWidth: 1)
            )
        }
        .onChange(of: selectedItem) { _, newValue in
            guard let newValue else { return }
            Task {
                if let data = try? await newValue.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    image = uiImage
                }
            }
        }
    }
}
