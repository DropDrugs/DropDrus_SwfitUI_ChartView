//
//  Created by 이예성 on 11/30/24.
//

import SwiftUI
import Charts

struct MonthlyStatsResponse: Identifiable {
    let id = UUID() // Identifiable을 위한 고유 ID
    let disposalCount: Int // 폐기 횟수
    let month: String // 월 이름 (예: "1월", "2월")
}

struct WasteChartView: View {
    // 더미 데이터
    let stats: [MonthlyStatsResponse] = [
        MonthlyStatsResponse(disposalCount: 13, month: "1월"),
        MonthlyStatsResponse(disposalCount: 1, month: "2월"),
        MonthlyStatsResponse(disposalCount: 5, month: "3월"),
        MonthlyStatsResponse(disposalCount: 9, month: "4월"),
        MonthlyStatsResponse(disposalCount: 17, month: "5월"),
        MonthlyStatsResponse(disposalCount: 2, month: "6월")
    ]

    var body: some View {
            let maxDisposal = max(stats.map { $0.disposalCount }.max() ?? 0, 20)
            
            VStack(alignment: .leading) {
                ForEach(stats) { data in
                    HStack {
                        Text(data.month)
                            .font(.caption)
                            .frame(width: 40, alignment: .leading)
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.red.opacity(0.2))
                                .frame(width: CGFloat(maxDisposal) / CGFloat(maxDisposal) * 200, height: 20)
                            
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.blue)
                                .frame(width: CGFloat(data.disposalCount) / CGFloat(maxDisposal) * 200, height: 20)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("월별 폐기량")
        }
    }

    struct ContentView: View {
        var body: some View {
            NavigationView {
                WasteChartView()
            }
        }
    }

    #if DEBUG
    struct WasteChartView_Previews: PreviewProvider {
        static var previews: some View {
            WasteChartView()
        }
    }
    #endif
