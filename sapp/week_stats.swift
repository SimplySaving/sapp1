//
//  stats.swift
//  sapp
//
//  Created by Sofya Chow on 3/22/21.
//
//dddd
import SwiftUI
import SwiftUICharts

struct week_stats: View {
    var body: some View {
        ZStack(alignment: .topTrailing){
            
            LinearGradient(gradient: .init(colors: [.red,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                LineChartView(data: [1, 2, 3], title: "Savings Progress")
                    .padding(.trailing, 60)
                Spacer()
                //Bar Chart
                BarChartView(data: ChartData(values: [
                    ("Day 1", 1),
                    ("Day 2", 2),
                    ("Day 3", 3),
                    ("Day 4", 4),
                    ("Day 5", 5),
                    ("Day 6",5),
                    ("Day 7", 5),
                    ]),
                    title:"bar chart")
                .padding(.trailing, 60)
                Spacer()
            }
        }
    }
}

struct week_stats_Previews: PreviewProvider {
    static var previews: some View {
        week_stats()
    }
}
