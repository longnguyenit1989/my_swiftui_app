//
//  CountdownView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 29/6/26.
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

        HStack(spacing: 8) {

            TimeCircle(
                value: hours,
                title: "hrs"
            )

            TimeCircle(
                value: minutes,
                title: "min"
            )

            TimeCircle(
                value: seconds,
                title: "sec"
            )
        }
        .onReceive(timer) { _ in
            guard remainingSeconds > 0 else { return }
            remainingSeconds -= 1
        }
    }

    private var hours: Int {
        remainingSeconds / 3600
    }

    private var minutes: Int {
        (remainingSeconds % 3600) / 60
    }

    private var seconds: Int {
        remainingSeconds % 60
    }
}
