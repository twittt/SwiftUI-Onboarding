//
//  MockConfirmInformationView.swift
//  ImperativeSwiftUI
//
//  Created by Tela Wittig on 8/12/24.
//

import SwiftUI

struct MockConfirmInformationView: View {
    var component: SecondComponent
    var body: some View {
        BaseView(title: "SecondComponent, SecondView", viewContent: "This is where we confirm the info we just collected") {
            MoveForwardButton {
                ButtonStyle(title: "Continue") {
                    component.next(outcome: .success)
                }
            }
        }
    }
}

#Preview {
    MockConfirmInformationView(component: SecondComponent(delegate: nil))
}
