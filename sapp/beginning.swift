//
//  beginning.swift
//  sapp
//
//  Created by Sofya Chow on 3/24/21.
//
//dddd
import SwiftUI

enum Page {
    case loginpage
    case tabpage
}

struct beginning: View {
    
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
