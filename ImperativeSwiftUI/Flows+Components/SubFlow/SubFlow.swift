//
//  SubFlow.swift
//  ImperativeSwiftUI
//
//  Created by Tela Wittig on 8/11/24.
//

import SwiftUI

class SubFlow: Flow {
    var currentPhase: (any Phase)?
    var delegate: (any Flow)?
    
    @Published var view: any View = Text("Default view for SubFlow") {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.view = self.view
            }
        }
    }
    
    init(delegate: (any Flow)? = nil) {
        self.delegate = delegate
        self.view = view
        self.currentPhase = SubFlowFirstComponent(delegate: self)
    }
    
    func phaseCompleted(phase: any Phase, outcome: PhaseOutcome) {
        print("\(phase) returned and outcome of \(outcome) to \(self)")
        if phase is SubFlowFirstComponent {
            handleCompletion(of: phase as! SubFlowFirstComponent, with: outcome)
        }
    }
    
    private func handleCompletion(of phase: SubFlowFirstComponent, with outcome: PhaseOutcome) {
        switch outcome {
        case .success:
            //Handle Success
            self.finalizeFlow(with: outcome)
        case .failure(let phaseFailureType):
            //Handle Failure
            self.finalizeFlow(with: outcome)
        case .skipped:
            //Handle Skip
            self.finalizeFlow(with: outcome)
        case .alreadyConfigured:
            //Handle Already Configured
            self.finalizeFlow(with: outcome)
        }
    }
    
    private func finalizeFlow(with outcome: PhaseOutcome) {
        delegate?.phaseCompleted(phase: self, outcome: outcome)
    }
}
