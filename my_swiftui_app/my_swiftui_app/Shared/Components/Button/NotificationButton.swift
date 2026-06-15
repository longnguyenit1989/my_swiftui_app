//
//  NotificationButton.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 15/6/26.
//

import SwiftUI

struct NotificationButton: View {
    let unreadCount: Int
    
    private var badgeText: String {
        unreadCount > 99 ? "99+" : "\(unreadCount)"
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Image(systemName: "bell.fill")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(AppColor.shared.primary)
            
            if unreadCount > 0 {
                Text(badgeText)
                    .textJp10(color: .white)
                    .frame(
                        minWidth: unreadCount >= 10 ? 18 : 14,
                        minHeight: 14,
                        alignment: .center
                    )
                    .background(AppColor.shared.primary)
                    .clipShape(Capsule())
                    .overlay {
                        Capsule().stroke(.white, lineWidth: 1)
                    }
                    .offset(x: 4, y: -4)
            }
        }
        .contentShape(Rectangle())
        .accessibilityLabel("Notifications")
    }
}
