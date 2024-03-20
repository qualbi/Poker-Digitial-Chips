//
//  MatchManager+GKMatchDelegate.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 3/7/24.
//

import Foundation
import GameKit

extension MatchManager: GKMatchDelegate {
    //Need to change string into int(bet amounts)
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        let content = String(decoding: data, as: UTF8.self)
        
        if content.starts(with: "strData:") {
            let message = content.replacing("StrData:", with: "")
            receivedString(message)
        } else {
            
        }
    }
    
    func sendString(_ message: String) {
        guard let encoded = "strData:\(message)".data(using: .utf8)
        else {return}
        sendData(encoded, mode: .reliable)
    }
    
    func sendBets(_ bets: Int) {
        let encodedBet = withUnsafeBytes(of: bets) { Data($0) }
        sendData(encodedBet, mode: .reliable)
    }
    
    func sendData(_ data: Data, mode: GKMatch.SendDataMode) {
        do {
            try match?.sendData(toAllPlayers: data, with: mode)
        } catch {
            print(error)
        }
    }
    
    func match(_ match: GKMatch, player: GKPlayer, didChange state: GKPlayerConnectionState) {
        guard state == .disconnected && !isGameOver else {return}
        let alert = UIAlertController(title: "Player Disconnected", message: "Another player has disconnected from the game.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.match?.disconnect()
        })
        
        DispatchQueue.main.async {
            self.resetGame()
            self.rootViewController?.present(alert, animated: true)
        }
    }
}
