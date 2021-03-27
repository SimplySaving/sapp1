//
//  stats.swift
//  sapp
//
//  Created by Sofya Chow on 3/22/21.
//
//
import SwiftUI
import SwiftUICharts

struct month_stats: View {
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
                    ("Week 1", 1),
                    ("Week 2", 2),
                    ("Week 3", 3),
                    ("Week 4", 4),
                    ]),
                    title:"bar chart")
                .padding(.trailing, 60)
                Spacer()
            }
        }
    }
}

struct month_stats_Previews: PreviewProvider {
    static var previews: some View {
        month_stats()
    }
}
