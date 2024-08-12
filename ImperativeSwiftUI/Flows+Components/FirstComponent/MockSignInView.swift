//
//  MockSignInView.swift
//  ImperativeSwiftUI
//
//  Created by Tela Wittig on 8/12/24.
//

import SwiftUI

struct MockSignInView: View {
    var component: any Component
    var body: some View {
        BaseView(title: "FirstComponent, FirstView", viewContent: "Sign In") {
            MoveForwardButton {
                ButtonStyle(title: "Continue") {
                    component.next(outcome: .success)
                }
            }
        }
    }
}

#Preview {
    MockSignInView(component: FirstComponent(delegate: nil))
}
