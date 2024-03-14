//
//  MatchManager.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 2/19/24.
//

import Foundation
import GameKit

class MatchManager: NSObject, ObservableObject {
    @Published var authenicationState = PlayerAuthState.authenticating
    @Published var inGame = false
    @Published var isGameOver = false
    
    @Published var currentlyBetting = false
    @Published var players = [PlayerManager]()
    @Published var currentTurn = ""
    @Published var deal = ""
    
    @Published var currentPot = 0
    @Published var pastBet = 0
    
    var match: GKMatch?
    var otherPlayer: GKPlayer?
    var localPlayer = GKLocalPlayer.local
    
    var playerUUIDKey = UUID().uuidString
    
    var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }
    
    func authenicateUser() {
        GKLocalPlayer.local.authenticateHandler = { [self] vc, e in
            if let viewController = vc {
                rootViewController?.present(viewController, animated: true)
            }
            
            if let error = e {
                authenicationState = .error
                print(error.localizedDescription)
                
                return
            }
            
            if localPlayer.isAuthenticated {
                if localPlayer.isMultiplayerGamingRestricted {
                    authenicationState = .restricted
                } else {
                    authenicationState = .authenicated
                }
            } else {
                authenicationState = .unauthenicated
            }
            
        }
    }
    
    func startMatchmaking(){
        let request = GKMatchRequest()
        request.minPlayers = 2
        request.maxPlayers = 10
        
        let matchmakingVC = GKMatchmakerViewController(matchRequest: request)
        matchmakingVC?.matchmakerDelegate = self
        
        rootViewController?.present(matchmakingVC!, animated: true)
    }
    
    func startGame(newMatch: GKMatch) {
        match = newMatch
        match?.delegate = self
        otherPlayer = match?.players.first
        currentPot = 0
        
        sendString("began:\(playerUUIDKey)")
    }
    
    func receivedString(_ message: String) {
        let messageSplit = message.split(separator: ":")
        guard let messagePrefix = messageSplit.first else {return}
        
        let parameter = String(messageSplit.last ?? "")
        
        switch messagePrefix {
        case "began":
            if playerUUIDKey == parameter {
                playerUUIDKey = UUID().uuidString
                sendString("began:\(playerUUIDKey)")
                break
            }
            
            currentlyBetting = playerUUIDKey < parameter
            inGame = true
            
        default:
            break
        }
    }
    
    func receivedBets(_ bets: Int) {
        if bets > 0 {
            currentPot += bets
            sendBets(currentPot)
        } else {return}
    }
}


struct Player {
    var playerName = ""
    var playerCash = 500
    
    var currentBet = 0
    var bigBlind = false
    var smallBlind = false
    
    var isTurn = false
    var forfeit = false
}
