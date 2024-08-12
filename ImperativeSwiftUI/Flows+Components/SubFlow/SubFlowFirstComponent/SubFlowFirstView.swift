//
//  SubFlowFirstView.swift
//  ImperativeSwiftUI
//
//  Created by Tela Wittig on 8/12/24.
//

import SwiftUI

struct SubFlowFirstView: View {
    var component: any Component
    var body: some View {
        BaseView(title: "SubFlowFirstComponent, FirstView", viewContent: "I'm in a nested flow") {
            MoveForwardButton {
                ButtonStyle(title: "Keep on Moving") {
                    component.next(outcome: .success)
                }
            }
        }
    }
}

#Preview {
    SubFlowFirstView(component: SubFlowFirstComponent(delegate: nil))
}
