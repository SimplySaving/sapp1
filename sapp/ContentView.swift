//
//  ContentView.swift
//  sapp
//
//  Created by Alexandra Mai on 3/12/21.
//
// ContentView.swift contains the Login page to enter username and
// password.

import SwiftUI

struct Person: Codable {
    let username1: String
    let password2: String
    
    init (username1: String, password2: String) {
        self.username1 = username1
        self.password2 = password2
    }
}

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var showLoginView: Bool = false
    @State var username: String = ""
    @State var password: String = ""
    //    @State var username = Person(username1: "", password2: "")
    //    @State var user = Person()
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    // to do: implement Core Data
    // bug: 'executeFetchRequest:error: A fetch request must have an entity.'
    // @FetchRequest(sortDescriptors: [])
    // private var tasks: FetchedResults<User>
    
    var body: some View {
        
        // ZStack allows for overlapping
        ZStack(alignment: .topTrailing){
            
            LinearGradient(gradient: .init(colors: [.red,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            // VStack will display top to bottom
            VStack(spacing: 10) {
                Text("Welcome!")
                    .multilineTextAlignment(.center)
                    .font(.custom("Futura", size: 25))
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                
                // HStack displays left to right
                HStack {
                    // SwiftUI allows for SF symbols (imported and default images
                    // from Apple) to be instantiated as icons
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
                    
                    // SecureField hides entered text
                    SecureField("Password", text: $password)
                        .font(.custom("Futura", size: 21))
                        .foregroundColor(.gray)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    // let person = Person(username1: "hello", password2: "hello")
                    self.sendData()
                    // once the Enter button is hit, the view shall
                    // navigate to the Tab page
                    viewRouter.currentPage = .tabpage
                }) {
                    
                    Text("Enter")
                        .font(.custom("Futura", size: 22))
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                        .foregroundColor(.white)
                }.padding()
                
            } // end of VStack
            .offset(y: 100)
            .padding(.horizontal, 30)
            
        } // end of ZStack
    } // end of body
    
    // function to send data over internet
    // post data from your app to servers
    func sendData() {
        
        // preparing JSON data for upload
        let person = Person(username1: username, password2: password)
        guard let uploadData = try? JSONEncoder().encode(person) else {
            print("Failed to encode person")
            return
        }
        
        // configuring a URL request
        let url = URL(string: "https://simplysaving.000webhostapp.com/index.php")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = uploadData
        
        // starting an upload tast
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            if let error = error {
                print ("error: \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                print ("server error")
                return
            }
            if let mimeType = response.mimeType,
                mimeType == "application/json",
                let data = data,
                let dataString = String(data: data, encoding: .utf8) {
                print ("got data: \(dataString)")
            }
        }
        task.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
