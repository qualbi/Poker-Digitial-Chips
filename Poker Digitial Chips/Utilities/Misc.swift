//
//  Misc.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 2/19/24.
//

import Foundation

enum PlayerAuthState: String {
    case authenticating = "Logging in to Game Center..."
    case unauthenicated = "Please sign in to Game Center to play."
    case authenicated = ""
    
    case error = "There was an error logging into Game Center."
    case restricted = "You're not allowed to play multiplayer games"
}
