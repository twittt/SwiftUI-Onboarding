//
//  SecondComponent.swift
//  ImperativeSwiftUI
//
//  Created by Tela Wittig on 8/11/24.
//

import SwiftUI

class SecondComponent: Component {
    var abortIfAlreadyConfigured: Bool
    var delegate: (any Flow)?

    @Published var view: any View = Text("Default view for SecondComponent") {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.view = self.view
            }
        }
    }
    
    init(abortIfAlreadyConfigured: Bool = false, delegate: (any Flow)?) {
        self.abortIfAlreadyConfigured = abortIfAlreadyConfigured
        self.delegate = delegate
        self.setInitialView()
    }
    
    private func setInitialView() {
        self.view = MockCollectInformationView(component: self)
    }
    
    func continueToConfirmation() {
        self.view = MockConfirmInformationView(component: self)
    }
    
    func next(outcome: PhaseOutcome) {
        self.delegate?.phaseCompleted(phase: self, outcome: outcome)
    }
}
