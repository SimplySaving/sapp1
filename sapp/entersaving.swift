//
//  entersaving.swift
//  sapp
//
//  Created by Sofya Chow on 3/17/21.
//
//
import SwiftUI
import CoreData
import UIKit


// ObservableObjects can be tracked through multiple views
class Amount: ObservableObject{
    @Published var input = ""
    @Published var destination = ""
}

struct entersaving: View {
    
    // to bind tabs
    @Binding var selection: Int
    // access output through this variable
    @ObservedObject var amount = Amount()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        // a Zstack allows for images to be stacked
        // front and back view
        NavigationView {
            ZStack(alignment: .topTrailing){
                LinearGradient(gradient: .init(colors: [.red,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                // a Vstack will display top to bottom
                VStack(spacing: 10) {
                    Text("Please enter the amount you just saved and its location:")
                        .multilineTextAlignment(.center)
                        .font(.custom("Futura", size: 25))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                    HStack {
                        //tag
                        Image(systemName:"dollarsign.circle").foregroundColor(.green)
                            .font(Font.system(size: 35, weight: .bold))
                        
                        TextField("Amount", text: $amount.input, onCommit: {
                            self.endTextEditing()
                        })
                        
                        .font(.custom("Futura", size: 21))
                        .foregroundColor(.gray)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    }
                    HStack(spacing: 5) {
                        Image(systemName:"questionmark.folder").foregroundColor(.green)
                            .font(Font.system(size: 33, weight: .bold))
                        Menu {
                            Button (action: {
                                self.amount.destination = "Savings"
                            }) {
                                Text("Savings")
                                    .font(.custom("Futura", size: 21))
                            }
                            Button (action: {
                                self.amount.destination = "Loans"
                            }) {
                                Text("Loans")
                                    .font(.custom("Futura", size: 21))
                            }
                            Button (action: {
                                self.amount.destination = "Investments"
                            }) {
                                Text("Investments")
                                    .font(.custom("Futura", size: 21))
                            }
                        } label: {
                            TextField("Category", text: $amount.destination)
                                .font(.custom("Futura", size: 21))
                                .foregroundColor(.gray)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                        }
                    } // end of vstack
                    
                    NavigationLink(
                        destination: secondView(amount: amount)) {
                        Text("Enter")
                            .font(.custom("Futura", size: 30))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                            .foregroundColor(.white)
                    }.padding(.vertical, 15)
                    // performs action + navigating to another view
                    .simultaneousGesture(TapGesture().onEnded{
                        saveAmount()
                        self.presentationMode.wrappedValue.dismiss()
                    })
                }.padding(.horizontal, 25)
                .onTapGesture {
                    selection = 2
                }
                .offset(y: 75)
            } // end of zstack
            .onTapGesture {
                self.endTextEditing()
            }
            
        } // end of navigationview
        
    } // end of body
    
    // this function updates variable Amount in core data
    func saveAmount(){
        let myInt1 = Int16(amount.input) ?? Int16(0)
        //guard self.amount != Int($0) else {return}
        let newAmount = DummyDailySavings(context: viewContext)
        newAmount.amount = myInt1
        newAmount.savingType = amount.destination
        newAmount.enteredDay = Date()
        do {
            try viewContext.save()
            print("value saved.")
            presentationMode.wrappedValue.dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct secondView: View{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var amount = Amount()
    @State private var isShareSheetShowing = false
    
    var btnBack : some View { Button(action: {
    }) {
        HStack {
            Image(systemName: "arrowshape.turn.up.left.fill") .font(.system(size: 35))
                .foregroundColor(.white)
        }
    }
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            LinearGradient(gradient: .init(colors: [.red,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            // a Vstack will display top to bottom
            VStack(spacing: 10) {
                Text("Congratulations! You just saved $\(amount.input) towards your \(amount.destination)!")
                    .multilineTextAlignment(.center)
                    .font(.custom("Futura", size: 30))
                    .foregroundColor(.white)
                    .padding(.vertical, 30)
                
                // to do: implement Twitter API to connect app
                Button(action: {
                    shareButton()
                }) {
                    Text("Share on Twitter")
                        .font(.custom("Futura", size: 25))
                        .padding(12)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                Text("Or Visit Twitter")
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: "https://twitter.com")!, options: [:])
                    }
                    .font(.custom("Futura", size: 20))
                    .foregroundColor(.white)
                
            } // end of vstack
            .padding(.horizontal, 25)
            .offset(y: 90)
        } // end of zstack
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
    
    // this function enables Twitter sharing
    func shareButton() {
        isShareSheetShowing.toggle()
        let shareText = "I just saved $\(amount.input) towards my \(amount.destination) on the SimplySaving app!"
        
        let vc = UIActivityViewController(activityItems: [shareText], applicationActivities: [])
        vc.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        UIApplication.shared.windows.first?.rootViewController!.present(vc, animated: true, completion: nil)
    }
}

struct entersaving_Previews: PreviewProvider {
    static var previews: some View {
        entersaving(selection: .constant(1))
    }
}

// this allows keyboard to be hidden when clicked elsewhere
extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
