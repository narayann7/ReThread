//
//  SignUp.swift
//  Rethread
//
//  Created by narayan on 07/04/24.
//

import SwiftUI

struct SignUp: View {
    
    
    @State var emailText:String = "";
    @State var passwordText:String = "";
    @State var nameText:String = "";
    @State var userNameText:String = "";
    @Environment(\.dismiss) var pop ;
    
    
    var body: some View {
        VStack {
            Spacer()
            VStack(
                spacing: 12,
                content: {
                    
                    Image("rethread-icon").resizable().scaledToFit().frame(width: 150)
                    Spacer().frame(height: 10)
                    TextField("Enter your email",text: $emailText).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/).modifier(AuthTextFieldModifier())
                    SecureField("Enter your password",text: $passwordText).modifier(AuthTextFieldModifier())
                    TextField("Enter your user name",text: $userNameText).modifier(AuthTextFieldModifier())
                    TextField("Enter your name",text: $nameText).modifier(AuthTextFieldModifier())
                    Spacer().frame(height: 30)
                    Button {
                        
                    } label: {
                        Text("Sign Up").modifier(FlatButtonTextModifier())
                    }
                })
            Spacer()
            Divider()
            HStack(spacing:4){
                Text("Already have an account?").fontWeight(.medium)
                
                Button {
                  pop()
                } label: {
                    Text("Sign in").fontWeight(.bold).foregroundStyle(AppColours.primary)
                }

                
               
            }.padding(.top,30)
        }
        .padding(.horizontal,25).modifier(RootViewModifier())
    }
}

#Preview {
    SignUp()
}
