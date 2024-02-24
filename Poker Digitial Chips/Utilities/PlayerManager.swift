//
//  PlayerManager.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 2/23/24.
//

import Foundation

class PlayerManager: ObservableObject {
    @Published var playerName = ""
    @Published var playerCash = 500
    @Published var bankrupt = false
    if playerCash = 0 {
        bankrupt = true
    }
    
    @Published var currentBet = 0
    @Published var bigBlind = false
    @Published var smallBlind = false
}
