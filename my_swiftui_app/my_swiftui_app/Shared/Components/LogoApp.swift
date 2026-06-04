//
//  LogoMyJapanView.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 2/6/26.
//

import SwiftUI

struct LogoApp: View {
    var body: some View {
        VStack {
            Image("logoApp")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 500, maxHeight: 180)
        }
        
    }
}

#Preview {
    LogoApp()
}
