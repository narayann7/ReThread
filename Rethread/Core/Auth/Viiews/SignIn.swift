//
//  SignIn.swift
//  Rethread
//
//  Created by narayan on 07/04/24.
//

import SwiftUI

struct SignIn: View {

    
    @State var emailText:String = "";
    @State var passwordText:String = "";
    
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                VStack(
                    spacing: 12,
                    content: {
                    
                    Image("rethread-icon").resizable().scaledToFit().frame(width: 150)
                        Spacer().frame(height: 10)
                    TextField("Enter your email",text: $emailText).padding(14).background(AppColours.grey6).cornerRadius(10)
                    SecureField("Enter your password",text: $passwordText).padding(14).background(Color(.systemGray6)).cornerRadius(10)
                    
                    Text("Forgot password?").frame(maxWidth: .infinity,alignment: .trailing)
                    
                        NavigationLink {
                            
                        } label: {
                            Button {
                                
                            } label: {
                                Text("Login").modifier(FlatButtonText())
                            }
                        }

                })
                
                Spacer()
                Divider()
                HStack(spacing:4){
                    Text("Don't have an account?").fontWeight(.medium)
                    Text("Sign up").fontWeight(.bold)
                }.padding(.top,30)
                
                
                
                
            }
            .padding()
        }.modifier(RootViewModifier())
    }
}

#Preview {
    SignIn()
}
