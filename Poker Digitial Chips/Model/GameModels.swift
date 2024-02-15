//
//  GameModels.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 2/6/24.
//

import Foundation

//Descriptions for each gamemode
enum GameType {
    case single, peer, undetermined
    
    var description: String {
        switch self{
        case .single:
            return "Keep track of your own chips"
        case .peer:
            return "Connect with friends to track everyone's chips"
        case .undetermined:
            return ""
        }
    }
}

struct Player {
    var name: String
    var money: Int = 500
    var loser = false
    var isCurrent = false
}

