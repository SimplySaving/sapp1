//
//  stats.swift
//  sapp
//
//  Created by Sofya Chow on 3/22/21.
//

import SwiftUICharts
import SwiftUI

struct year_stats: View {
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
                    ("Jan", 1),
                    ("Feb", 2),
                    ("Mar", 3),
                    ("Apr", 4),
                    ("May", 5),
                    ("June",5),
                    ("Jul", 5),
                    ("Aug", 5),
                    ("Sep", 5),
                    ("Oct", 5),
                    ("Nov", 5),
                    ("Dec", 5),
                    ]),
                    title:"bar chart")
                .padding(.trailing, 60)
                Spacer()
            }
        }
    }
}

struct year_stats_Previews: PreviewProvider {
    static var previews: some View {
        year_stats()
    }
}
