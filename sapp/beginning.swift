//
//  beginning.swift
//  sapp
//
//  Created by Sofya Chow on 3/24/21.
//
// beginning.swift is the medium between the Login page and the Tab/Home page
// Since navigation links are equipped with navigation bars, we created a
// StateObject viewRouter that allows us to track and tag distinct views

import SwiftUI

// differentiate between the two views
enum Page {
    case loginpage
    case tabpage
}


struct beginning: View {
    
    // helps us navigate between views (non-navigationlink method)
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .loginpage:
            ContentView(viewRouter: viewRouter)
        case .tabpage:
            tab(viewRouter: viewRouter)
        }
    }
}

struct beginning_Previews: PreviewProvider {
    static var previews: some View {
        beginning(viewRouter: ViewRouter())
    }
}

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .loginpage
}
