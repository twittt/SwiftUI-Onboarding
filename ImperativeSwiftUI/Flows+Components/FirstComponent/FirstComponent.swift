//
//  FirstComponent.swift
//  ImperativeSwiftUI
//
//  Created by Tela Wittig on 8/11/24.
//

import SwiftUI

class FirstComponent: Component {
    var abortIfAlreadyConfigured: Bool
    var delegate: (any Flow)?

    @Published var view: any View = Text("Default view for FirstComponent") {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.view = self.view
            }
        }
    }
    
    init(abortIfAlreadyConfigured: Bool = false, delegate: (any Flow)?) {
        self.abortIfAlreadyConfigured = abortIfAlreadyConfigured
        self.delegate = delegate
        
        if checkAuthenticationState() {
            self.next(outcome: .alreadyConfigured)
        } else {
            self.view = MockSignInView(component: self)
        }
    }
    
    private func checkAuthenticationState() -> Bool {
        return Bool.random()
    }
    
    func next(outcome: PhaseOutcome) {
        self.delegate?.phaseCompleted(phase: self, outcome: outcome)
    }
}
