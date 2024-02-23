//
//  MatchManager.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 2/19/24.
//

import Foundation

class MatchManager: ObservableObject {
    @Published var authenicationState = PlayerAuthState.authenticating
    @Published var inGame = false
    @Published var isGameOver = false
    
    @Published var currentlyBetting = false
    @Published var players : [String] = []
    @Published var currentTurn = ""
    @Published var bigBlind = ""
    @Published var smallBlind = ""
    //Possible Dealer Variable
    
    @Published var currentPot = 0
    @Published var pastBet = 0
}
