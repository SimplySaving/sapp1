//
//  stats.swift
//  sapp
//
//  Created by Sofya Chow on 3/22/21.
//
//
import SwiftUI
import SwiftUICharts

struct week_stats: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [.red,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                //Bar Chart
                BarChartView(data: ChartData(values: [
                    ("Day 1", 10),
                    ("Day 2", 10),
                    ("Day 3", 3),
                    ("Day 4", 4),
                    ("Day 5", 2),
                    ("Day 6", 9),
                    ("Day 7", 3),
                    ]),
                    title:"Savings Chart")
                //.padding(.trailing, 60)
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
