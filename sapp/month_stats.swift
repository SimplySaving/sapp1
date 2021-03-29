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
        ZStack{
            
            LinearGradient(gradient: .init(colors: [.red,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                //Bar Chart
                BarChartView(data: ChartData(values: [
                    ("Week 1", 50),
                    ("Week 2", 70),
                    ("Week 3", 90),
                    ("Week 4", 40),
                    ]),
                    title:"Monthly Savings")
                //.padding(.trailing, 60)
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
