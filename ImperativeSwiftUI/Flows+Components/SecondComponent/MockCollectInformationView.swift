//
//  MockCollectInformationView.swift
//  ImperativeSwiftUI
//
//  Created by Tela Wittig on 8/12/24.
//

import SwiftUI

struct MockCollectInformationView: View {
    var component: SecondComponent
    var body: some View {
        BaseView(title: "SecondComponent, FirstView", viewContent: "This is where we collect some information for onboarding") {
            MoveForwardButton {
                ButtonStyle(title: "Continue") {
                    component.continueToConfirmation()
                }
            }
        }
    }
}

#Preview {
    MockCollectInformationView(component: SecondComponent(delegate: nil))
}
