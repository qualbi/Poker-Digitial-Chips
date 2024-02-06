//
//  StartView.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 2/4/24.
//

import SwiftUI

struct StartView: View {
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
