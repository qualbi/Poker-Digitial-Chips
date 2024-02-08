//
//  StartView.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 2/4/24.
//

import SwiftUI

struct StartView: View {
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @FocusState private var focus: Bool
    var body: some View {
        ZStack{
            Image("Poker Background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("Title")
                    .resizable()
                    .frame(width: 230, height: 285)
                Text("Welcome to Digital")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Poker Chips")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Spacer()
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
                        }
                    case .peer:
                        TextField("Your Name", text: $yourName)
                    case .undetermined:
                        EmptyView()
                    }
                }
                Button {
                    
                }
            label: {Text("Play")
                    .font(.title)
                
            }
                Spacer()
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
