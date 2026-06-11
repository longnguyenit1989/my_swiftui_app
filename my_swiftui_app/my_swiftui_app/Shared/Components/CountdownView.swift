//
//  CountdownView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 11/6/26.
//

import SwiftUI
import Combine

struct CountdownView: View {
    let initialSeconds: Int
    
    @State private var remainingSeconds: Int
    
    init(initialSeconds: Int) {
        self.initialSeconds = initialSeconds
        _remainingSeconds = State(initialValue: initialSeconds)
    }
    
    private let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
    var body: some View {
        HStack(spacing: AppSpacing.xs) {
            Text(AppStrings.Home.closingIn.l10n).foregroundStyle(AppColor.shared.textTertiary)
            
            Text(formattedTime)
                .foregroundStyle(AppColor.shared.primary)
                .fontWeight(.semibold)
        }
        .onReceive(timer) { _ in
            guard remainingSeconds > 0 else { return }
            remainingSeconds -= 1
        }
    }
    
    private var formattedTime: String {
        let hours = remainingSeconds / 3600
        let minutes = (remainingSeconds % 3600) / 60
        let seconds = remainingSeconds % 60
        
        return String(
            format: "%02d : %02d : %02d",
            hours,
            minutes,
            seconds
        )
    }
}
