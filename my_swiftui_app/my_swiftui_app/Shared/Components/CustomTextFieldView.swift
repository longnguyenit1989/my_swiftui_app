//
//  CustomTextFieldView.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 2/6/26.
//

import SwiftUI

struct CustomTextFieldView: View {
    var title: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField(title.l10n, text: $text)
                .padding(.horizontal, 12)
                .frame(height: 48)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(AppColor.shared.border, lineWidth: 1))
        }
    }
}

#Preview {
    CustomTextFieldView(title: "First name", text: .constant("Anonymous"))
}
