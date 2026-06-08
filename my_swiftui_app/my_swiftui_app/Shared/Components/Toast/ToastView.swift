//
//  ToastView.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import SwiftUI

struct ToastView: View {
    let message: String

    var body: some View {
        Text(message.l10n)
            .font(.system(size: 14))
            .foregroundStyle(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.black.opacity(0.85))
            .cornerRadius(10)
            .padding(.bottom, 40)
    }
}
