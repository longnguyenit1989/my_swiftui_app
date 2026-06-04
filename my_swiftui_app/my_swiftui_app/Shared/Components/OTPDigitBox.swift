//
//  OTPView.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import SwiftUI

struct OTPDigitBox: View {
    @Binding var otp: String
    @FocusState private var isFocused: Bool
    
    private let length = 6
    
    var body: some View {
        ZStack {
            TextField("", text: $otp)
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .focused($isFocused)
                .opacity(0.01)
                .frame(width: 1, height: 1)
                .onChange(of: otp) { _, newValue in
                    otp = String(newValue.prefix(length))
                        .filter(\.isNumber)
                }
            HStack(spacing: 12) {
                ForEach(0..<length, id: \.self) { index in
                    ZStack {
                        if digit(at: index).isEmpty &&
                            otp.count == index &&
                            isFocused {
                            BlinkingCursor()
                        }
                        Text(digit(at: index))
                            .font(.title2.bold())
                    }
                    .frame(width: 48, height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(
                                otp.count == index
                                ? .blue
                                : .gray.opacity(0.4),
                                lineWidth: 1.5
                            )
                    )
                }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isFocused = true
        }
        .onAppear {
            isFocused = true
        }
    }
    
    private func digit(at index: Int) -> String {
        guard index < otp.count else { return "" }
        return String(Array(otp)[index])
    }
}

private struct BlinkingCursor: View {
    @State private var visible = true
    var body: some View {
        Rectangle()
            .frame(width: 2, height: 24)
            .opacity(visible ? 1 : 0)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: 0.6)
                    .repeatForever(autoreverses: true)
                ) {
                    visible.toggle()
                }
            }
    }
}

#Preview {
    OTPPreviewWrapper()
}

private struct OTPPreviewWrapper: View {
    @State private var otp = ""
    var body: some View {
        OTPDigitBox(otp: $otp)
            .padding()
    }
}
