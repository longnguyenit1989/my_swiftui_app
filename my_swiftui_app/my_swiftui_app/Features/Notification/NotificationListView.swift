//
//  NotificationListView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 15/6/26.
//

import SwiftUI

struct NotificationListView: View {
    var body: some View {
        List {
            ForEach(1...15, id: \.self) { index in
                let isUnread = index <= 5

                HStack(alignment: .top, spacing: 12) {
                    Circle()
                        .fill(isUnread ? AppColor.shared.primary : .clear)
                        .frame(width: 8, height: 8)
                        .padding(.top, 6)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Notification \(index)")
                            .font(.headline)

                        Text("This is notification content \(index)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle(AppStrings.Notifications.notifications.l10n)
        .navigationBarTitleDisplayMode(.inline)
        .hideBottomBar()
    }
}
