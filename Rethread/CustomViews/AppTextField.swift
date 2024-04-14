//
//  AppTextField.swift
//  Rethread
//
//  Created by narayan on 14/04/24.
//

import SwiftUI

struct AppTextFieldX: View {
    @State var text: String = ""

    @State var local: (() -> Void)? = nil
    var body: some View {
        AppTextField(text: $text, hint: "Enter your email please",

                     validator: { value in

                         if value.count != 0 {
                             return nil
                         } else {
                             return "string atleast 4 char"
                         }
                     },

                     autoValidate: false,
                     validate: { validateFun in
                        validateFun()
                     }).padding(20)

        Button {
            local?()
        } label: {
            Text("hey")
        }
    }
}



//class TextEditingController {
//    var text : String
//    var 
//}

class AppTextFieldViewModel: ObservableObject {
    // state variables
    @Published var isValid: Bool = true
    @Published var errorText: String? = ""
    @Published var text: String = ""
    @Published var autoValidate: Bool?
    var validator: ((_ value: String) -> String?)? = nil

    // init method
    init(validator: ((_ value: String) -> String?)? = nil,
         autoValidate: Bool? = false,
         validate: ((_ validateFun: @escaping () -> Void) -> Void)? = nil)
    {
        self.validator = validator
        self.autoValidate = autoValidate

        if validate != nil {
            validate? {
                self.validate()
            }
        }
    }

    // helper methods
    func onChanged(value: String) {
        if autoValidate ?? false && validator != nil {
            errorText = validator?(value)
            if errorText != nil {
                isValid = false
            } else {
                isValid = true
            }
        }
    }

    func validate() {
//        print(text)
        print(errorText ?? "")

//        if autoValidate ?? false && validator != nil {
//            errorText = validator?(value)
//            if errorText != nil {
//                isValid = false
//            } else {
//                isValid = true
//            }
//        }
    }
}

struct AppTextField: View {
    var hint: String
    @StateObject private var appTextFieldViewModel: AppTextFieldViewModel

    init(text: Binding<String>,
         hint: String,
         validator: ((_ value: String) -> String?)? = nil,
         autoValidate: Bool? = false,
         validate: ((_ validateFun: @escaping () -> Void) -> Void)? = nil)
    {
        self.hint = hint
        _appTextFieldViewModel = StateObject(
            wrappedValue: AppTextFieldViewModel(
                validator: validator,
                autoValidate: autoValidate,
                validate: validate
            ))
    }

    var body: some View {
        VStack(alignment: .leading) {
            TextField(hint, text: $appTextFieldViewModel.text).autocapitalization(.none).modifier(AuthTextFieldModifier()).onChange(of: appTextFieldViewModel.text) { _, newValue in
                appTextFieldViewModel.onChanged(value: newValue)
            }

            if !appTextFieldViewModel.isValid {
                Text(appTextFieldViewModel.errorText ?? "").padding(.leading, 10).padding(.top, 1).foregroundColor(.red)
            }
        }
    }
}

#Preview {
    AppTextFieldX()
}
