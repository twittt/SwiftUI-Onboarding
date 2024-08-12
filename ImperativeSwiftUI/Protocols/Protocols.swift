//
//  FlowProtocol.swift
//  ImperativeSwiftUI
//
//  Created by Tela Wittig on 8/11/24.
//

import SwiftUI

protocol Phase: ObservableObject {
    var delegate: (any Flow)? { get set }
    var view: any View { get set }
}

protocol Flow: Phase {
    var currentPhase: (any Phase)? { get }
    func phaseCompleted(phase: any Phase, outcome: PhaseOutcome)
}

protocol Component: Phase {
    var abortIfAlreadyConfigured: Bool { get }
    func next(outcome: PhaseOutcome)
}
