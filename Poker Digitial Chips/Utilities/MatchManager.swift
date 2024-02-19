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
}
