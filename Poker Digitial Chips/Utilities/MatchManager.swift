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
    @Published var playerCash = [String: Int]()
    @Published var currentTurn = ""
    @Published var deal = ""
    
    @Published var pot = "pot 0"
    
    @Published var currentPot = 0
    @Published var pastBet = 0
    @Published var turn = 0
    
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
    
    func gameOver() {
        isGameOver = true
        match?.disconnect()
    }
    
    func resetGame() {
        DispatchQueue.main.async { [self] in
            isGameOver = false
            inGame = false
            currentPot = 0
            players.removeAll()
            pastBet = 0
        }
        
        match?.delegate = nil
        match = nil
        otherPlayer = nil
        playerUUIDKey = UUID().uuidString
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
        if bets > 0 || pastBet >= bets{
            currentPot += bets
            pastBet = bets
            sendBets(currentPot)
        } else {return}
    }
    
    func compareTo(party: String, ID: String) -> Bool{
        if party == ID{
            return true
        }
        return false
    }
    
    func rotate() {
        var size = players.count
        if (turn < size) {
            turn += 1
        } else {
            turn = 0
        }
    }
    
    func placeChecker() -> Bool {
        var size = players.count
        var last = size - 1
        if (turn == last) {
            return true
        }
        return false
    }
}

class PlayerManager: ObservableObject {
    var playerName = ""
    var playerUUID = ""
    var currentBet = 0
    var cash = 500
    
    var bigBlind = false
    var smallBlind = false
    
    var roundWinner = false
    var isTurn = false
    var forfeit = false
    
    
    func playerID() -> String {
        return self.playerUUID
    }
    
    func playerCash() -> Int {
        return self.cash
    }
}

/*
struct Player {
    var playerName = ""
    var playerCash = 500
    
    var currentBet = 0
    var bigBlind = false
    var smallBlind = false
    
    var isTurn = false
    var forfeit = false

}
*/
