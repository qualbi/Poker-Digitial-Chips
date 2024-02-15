//
//  GameService.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 2/14/24.
//

import Foundation

class GameService: ObservableObject {
    @Published var inGame = false
    @Published var gameOver = false
}
