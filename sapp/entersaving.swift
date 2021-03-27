//
//  entersaving.swift
//  sapp
//
//  Created by Sofya Chow on 3/17/21.
//

import SwiftUI

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
                        
                        TextField("Amount", text: $amount.input)
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
                    
                    NavigationLink(destination: secondView(amount: amount)) {
                        Text("Enter")
                            .font(.custom("Futura", size: 30))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                            .foregroundColor(.white)
                    }.padding(.vertical, 15)
                }.padding(.horizontal, 25)
                .onTapGesture {
                    selection = 2
                }
                .offset(y: 95)
            } // end of zstack
        } // end of navigationview
    } // end of body
}

struct secondView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject  var amount = Amount()
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
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
                }) {
                    Text("Share on Twitter")
                        .font(.custom("Futura", size: 25))
                        .padding(12)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            } // end of vstack
            .padding(.horizontal, 25)
            .offset(y: 100)
        } // end of zstack
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

struct entersaving_Previews: PreviewProvider {
    static var previews: some View {
        entersaving(selection: .constant(1))
    }
}
