//
//  LanguageSheetView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 5/6/26.
//

import SwiftUI

struct LanguageSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var languageManager: LanguageManager

    var body: some View {
        NavigationStack {
            List {
                Button(AppStrings.LanguageSheet.english.l10n) {
                    languageManager.changeLanguage(to: .english)
                    dismiss()
                }

                Button(AppStrings.LanguageSheet.japanese.l10n) {
                    languageManager.changeLanguage(to: .japanese)
                    dismiss()
                }
            }
            .navigationTitle(AppStrings.Profile.chooseLanguage.l10n)
            .navigationBarTitleDisplayMode(.inline)
        }
        .presentationDetents([.medium])
    }
}

#Preview {
    LanguageSheetView()
}
