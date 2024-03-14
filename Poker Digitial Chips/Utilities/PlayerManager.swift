//
//  PlayerManager.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 2/23/24.
//

import Foundation

class PlayerManager: ObservableObject {
    var playerName = ""
    var playerUUID = ""
    var currentBet = 0
    
    var bigBlind = false
    var smallBlind = false
    
    var isTurn = false
    var forfeit = false
}
