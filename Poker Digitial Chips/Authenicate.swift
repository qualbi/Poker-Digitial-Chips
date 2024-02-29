//
//  Authenicate.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 2/28/24.
//

import SwiftUI

struct Authenicate: View {
    
    @StateObject var matchManager = MatchManager()
    
    var body: some View {
        ZStack{
            if matchManager.isGameOver {
                StartView(matchManager: matchManager)
            }
            else if matchManager.inGame {
                ContentView(matchManager: matchManager)
            }
            else {
                StartView(matchManager: matchManager)
            }
        }
        .onAppear {
            matchManager.authenicateUser()
        }
        
    }
}

struct Authenicate_Previews: PreviewProvider {
    static var previews: some View {
        Authenicate()
    }
}
