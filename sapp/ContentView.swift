//
//  ContentView.swift
//  sapp
//
//  Created by Alexandra Mai on 3/12/21.
//
//
import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var showLoginView: Bool = false
    @State var username: String = ""
    @State var password: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    // ^ line added from https://blckbirds.com/post/core-data-and-swiftui/
    
    
    var body: some View {
        
        ZStack(alignment: .topTrailing){
            
            LinearGradient(gradient: .init(colors: [.red,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            // a Vstack will display top to bottom
            VStack(spacing: 10) {
                Text("Welcome!")
                    .multilineTextAlignment(.center)
                    .font(.custom("Futura", size: 25))
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                
                HStack {
                    Image(systemName:"person").foregroundColor(.white)
                        .font(Font.system(size: 35, weight: .bold))
                    
                    TextField("Username", text: $username)
                        .font(.custom("Futura", size: 21))
                        .foregroundColor(.gray)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
                HStack {
                    Image(systemName:"lock").foregroundColor(.white)
                        .font(Font.system(size: 35, weight: .bold))
                    
                    SecureField("Password", text: $password)
                        .font(.custom("Futura", size: 21))
                        .foregroundColor(.gray)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    guard self.username != "" else {return}
                    guard self.password != "" else {return}
                    let newUser = User(context: viewContext)
                    newUser.username = self.username
                    newUser.password = self.password
                    do {
                            try viewContext.save()
                            print("username saved.")
                        presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    viewRouter.currentPage = .tabpage
                }) {
                    
                    Text("Enter")
                        .font(.custom("Futura", size: 22))
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                        .foregroundColor(.white)
                }.padding()
                
            } // end of vstack
            .offset(y: 100)
            .padding(.horizontal, 30)
            
        } // end of zstack
    } // end of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
       // ContentView(viewRouter: ViewRouter()).environment(\.managedObjectContext, PersistenceControllerUser.preview.container.viewContext)
        // ^ added line from https://blckbirds.com/post/core-data-and-swiftui/
    }
}


