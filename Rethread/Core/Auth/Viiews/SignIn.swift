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
                        TextField("Enter your email",text: $emailText).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/) .modifier(AuthTextFieldModifier())
                        SecureField("Enter your password",text: $passwordText).modifier(AuthTextFieldModifier())
                        Text("Forgot password?").frame(maxWidth: .infinity,alignment: .trailing)
                        Button {
                            
                        } label: {
                            Text("Login").modifier(FlatButtonTextModifier())
                        }
                    })
                Spacer()
                Divider()
                HStack(spacing:4){
                    Text("Don't have an account?").fontWeight(.medium)
                    NavigationLink {
                        SignUp().navigationBarBackButtonHidden()
                    } label: {
                        Text("Sign up").fontWeight(.bold).foregroundStyle(AppColours.primary)
                    }
                    
                }.padding(.top,30)
            }
            .padding(.horizontal,25)
        }.modifier(RootViewModifier())
    }
}

#Preview {
    SignIn()
}
