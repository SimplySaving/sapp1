//
//  tab.swift
//  sapp
//
//  Created by Sofya Chow on 3/19/21.
//
// tab.swift contains customizations of the tab bar as well as navigation
// capabilities to certain views using TabView

import SwiftUI
import UIKit

struct tab: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var selection = 1
    
    var body: some View {
        
        TabView(selection: $selection) {
            stats()
                .tabItem {
                    Image(systemName: "waveform.path.ecg.rectangle")
                    Text("Stats")
                }
                .tag(1)
            
            entersaving(selection: $selection)
                .tabItem {
                    Image(systemName: "plus")
                    Text("Enter Savings")
                }
                .tag(2)
            
            contacts(selection: $selection)
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Friends")
                }
                .tag(3)
        }.accentColor(.darkpurple)
    }
}

struct tab_Previews: PreviewProvider {
    static var previews: some View {
        tab(viewRouter: ViewRouter())
    }
}

// contains the Contact tab view
// to do: Link Users with friends
struct contacts: View {
    
    @Binding var selection: Int
    
    var body: some View {
        
        ZStack(alignment: .center){
            
            LinearGradient(gradient: .init(colors: [.red,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                Text("Contacts List")
                    .multilineTextAlignment(.center)
                    .font(.custom("Futura", size: 25))
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                
            } // end of VStack
        } // enter of ZStack
    } // end of body
}

struct contacts_Previews: PreviewProvider {
    static var previews: some View {
        contacts(selection: .constant(1))
    }
}

// overriding the UITabBar to change visual appearance
extension UITabBarController {
    override open func viewDidLoad() {
        
        let appearance = UITabBarAppearance()
        
        appearance.backgroundColor = .newpurple
        appearance.stackedLayoutAppearance.normal.iconColor = .white
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        tabBar.standardAppearance = appearance
        
        let systemFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30.0)]
        UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributes, for: .normal)
    }
}

// creating custom colors
extension UIColor {
    static let newpurple = UIColor(red: 177 / 255, green: 82 / 255, blue: 218 / 255, alpha: 1)
}

extension Color {
    static let darkpurple = Color(red: 46 / 255, green: 46 / 255, blue: 184 / 255)
}
