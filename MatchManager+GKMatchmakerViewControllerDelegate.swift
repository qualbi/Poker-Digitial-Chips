//
//  MatchManager+GKMatchmakerViewControllerDelegate.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 3/2/24.
//

import Foundation
import GameKit

extension MatchManager: GKMatchmakerViewControllerDelegate {
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
        <#code#>
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        <#code#>
    }
    
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        <#code#>
    }
}
