//
//  ToastModifier.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var message: String?

    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                Spacer()
                if let message = message {
                    ToastView(message: message)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    self.message = nil
                                }
                            }
                        }
                }
            }
            .animation(.easeInOut, value: message)
        }
    }
}
