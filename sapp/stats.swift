//
//  stats.swift
//  sapp
//
//  Created by Sofya Chow on 3/22/21.
//
// stats.swift is the first and general view to appear upon the tab bar

import SwiftUI

struct stats: View {
    var body: some View {
        
        ZStack(){
            
            LinearGradient(gradient: .init(colors: [.red,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            TabView {
                week_stats()
                month_stats()
                year_stats()
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct stats_Previews: PreviewProvider {
    static var previews: some View {
        stats()
    }
}
