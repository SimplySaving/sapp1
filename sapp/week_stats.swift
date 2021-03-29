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
                    ("Monday", 10),
                    ("Tuesday", 10),
                    ("Wednesday", 3),
                    ("Thursday", 4),
                    ("Friday", 2),
                    ("Saturday", 9),
                    ("Sunday", 3),
                    ]),
                    title:"Weekly Savings")
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
