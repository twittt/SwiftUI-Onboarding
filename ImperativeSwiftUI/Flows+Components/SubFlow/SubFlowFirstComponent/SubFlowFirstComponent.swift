//
//  SubFlowFirstComponent.swift
//  ImperativeSwiftUI
//
//  Created by Tela Wittig on 8/11/24.
//

import SwiftUI

class SubFlowFirstComponent: Component {
    var abortIfAlreadyConfigured: Bool
    var delegate: (any Flow)?

    @Published var view: any View = Text("Default view for SubFlowFirstComponent") {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.view = self.view
            }
        }
    }
    
    init(abortIfAlreadyConfigured: Bool = false, delegate: (any Flow)?) {
        self.abortIfAlreadyConfigured = abortIfAlreadyConfigured
        self.delegate = delegate
        self.view = SubFlowFirstView(component: self)
    }
    
    func next(outcome: PhaseOutcome) {
        self.delegate?.phaseCompleted(phase: self, outcome: outcome)
    }
}
