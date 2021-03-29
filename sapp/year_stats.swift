//
//  stats.swift
//  sapp
//
//  Created by Sofya Chow on 3/22/21.
//
//
import SwiftUICharts
import SwiftUI

struct year_stats: View {
    var body: some View {
        ZStack(){
            
            LinearGradient(gradient: .init(colors: [.red,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                //Spacer()
                //Bar Chart
                BarChartView(data: ChartData(values: [
                    ("Jan", 444),
                    ("Feb", 888),
                    ("Mar", 232),
                    ("Apr", 423),
                    ("May", 906),
                    ("June",412),
                    ("Jul", 123),
                    ("Aug", 432),
                    ("Sep", 321),
                    ("Oct", 232),
                    ("Nov", 423),
                    ("Dec", 324),
                    ]),
                    title:"Savings Chart")
                //.padding(.trailing, 60)
                //Spacer()
            }
        }
    }
}

struct year_stats_Previews: PreviewProvider {
    static var previews: some View {
        year_stats()
    }
}
