//
//  WeeklySalesChartView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 24/6/26.
//

import SwiftUI
import Charts

struct WeeklySalesChartView: View {
    @State private var showFlashSale: Bool = false
    @Environment(\.locale) private var locale

    private let data: [WeeklySale] = [
        .init(dayKey: AppStrings.Chart.mon, sales: 3),
        .init(dayKey: AppStrings.Chart.tue, sales: 6),
        .init(dayKey: AppStrings.Chart.wed, sales: 4),
        .init(dayKey: AppStrings.Chart.thu, sales: 7),
        .init(dayKey: AppStrings.Chart.fri, sales: 5)
    ]
    
    private var chartData: [(day: String, sales: Int)] {
        data.map {
            (
                day: $0.dayKey.localized(locale: locale),
                sales: $0.sales
            )
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            SectionTitleView(title: AppStrings.Home.saleThisWeek) {
                showFlashSale = true
            }
            
            Chart(chartData, id: \.day) { item in
                BarMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales)
                )
                .annotation(position: .top) {
                    Text("\(item.sales)")
                        .font(.caption)
                }
            }
            .frame(height: 180)
            .chartYAxis(.hidden)
        }
        .navigationDestination(isPresented: $showFlashSale) {
            FlashSaleView().hideBottomBar()
        }
    }
}
