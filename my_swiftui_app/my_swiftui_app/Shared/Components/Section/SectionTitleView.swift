//
//  SectionTitleView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 8/6/26.
//

import SwiftUI

struct SectionTitleView: View {
    let title: String
    let action: (() -> Void)?
    
    init(title: String, action: (() -> Void)? = nil) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        HStack {
            Text(title.l10n).textJp16Bold()
            Spacer()
            
            if let action {
                Button {
                    action()
                } label: {
                    HStack(spacing: AppSpacing.xs) {
                        Image("circleArrowRightIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 32, maxHeight: 32)
                    }
                }
            }
        }
    }
}
