//
//  StartView.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 2/4/24.
//

import SwiftUI
import Foundation

struct StartView: View {
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @State private var playerCount = 0
    @FocusState private var focus: Bool
    @State private var startGame = false
    @StateObject var matchManager = MatchManager()
    
    
    var body: some View {
        ZStack{
            //Logo and App Title
            Image("Poker Background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("Title")
                    .resizable()
                    .frame(width: 230, height: 285)
                Text("Digital Poker Chips")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()

                //Gamemode selector
                Picker("Select Game", selection: $gameType) {
                    Text("Select Game Type").tag(GameType.undetermined)
                    Text("Alone").tag(GameType.single)
                    Text("With Friends").tag(GameType.peer)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 5).foregroundColor(.white))
                .accentColor(.white)
                
                Text(gameType.description)
                    .foregroundColor(.white)
                    .padding()
                VStack{
                    switch gameType {
                    case .single:
                        VStack{
                            TextField("Your Name", text: $yourName)
                            TextField("Player Count", value: $playerCount, format: .number)
                        }
                    case .peer:
                        TextField("Your Name", text: $yourName)
                    case .undetermined:
                        EmptyView()
                    }
                }
                .padding()
                .textFieldStyle(.roundedBorder)
                .focused($focus)
                .frame(width:350)
                
                if gameType != .peer{
                    Button ("Play") {
                        focus = false
                        matchManager.players.reserveCapacity(playerCount)
                        startGame.toggle()
                        matchManager.startMatchmaking()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(
                        gameType == .undetermined ||
                        gameType == .single && yourName.isEmpty ||
                        playerCount == 0 || playerCount == nil || playerCount > 10 || matchManager.authenicationState != .authenicated || matchManager.inGame
                    )
                    Text(matchManager.authenicationState.rawValue)
                        .foregroundColor(.white)
                        .padding()
            }
                Spacer()
            }
            .padding()
        }
        .fullScreenCover(isPresented: $startGame, content: {ContentView(matchManager: MatchManager())
            
        })
        .inNavigationStack()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(matchManager: MatchManager())
    }
}
