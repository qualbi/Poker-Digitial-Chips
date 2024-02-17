//
//  ContentView.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 1/26/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var potAmount:Int = 0
    @State var points:Int = 500
    @State var betAmount:Int = 0
    @State var pot:String = "pot 0"
    @State var reset:Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("Poker Background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                
                HStack{
                    //Reser Button
                    Button{
                        reset = true
                    }
                label: {Image("Title")
                        .resizable()
                        .frame(width:120, height: 120)
                        .alert(isPresented: $reset) {
                            Alert(title: Text("Do you want to leave the game?"), primaryButton: .default(Text ("Leave")){
                                potAmount = 0
                                points = 500
                                betAmount = 0
                                potChecker()
                                dismiss()
                                print("Game Reset")
                            }, secondaryButton: .cancel())
                        }
                }
                    Spacer()
                    
                }
                Text("Total Pot: $\(potAmount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                //Pot Image
                Image(pot)
                    .resizable()
                    .frame(width: 170, height: 170)
                
                
                Spacer()
                
                HStack {

                        //Check Button
                        Button{
                            
                        }
                    label: {Image("Check")
                            .resizable()
                            .frame(width: 100, height: 50)
                        
                    }
                        //Bet Button
                        Button{
                            betPot()
                        }
                    label: {Image("Bet")
                            .resizable()
                            .frame(width: 100, height: 50)
                        
                    }
                        //Fold Button
                        Button{
                            
                        }
                    label: {Image("Fold")
                            .resizable()
                            .frame(width: 100, height: 50)
                        
                    }
                }
                
                Spacer()
                
                Text("Bet Amount: $\(betAmount)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Text("Cash: $\(points)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                HStack{
                    Group{
                        //White Chips
                        Button{
                            possibleHand(gamble: points, taken: 1)
                            print("White Chip")
                        }
                    label: {Image("White Chip")
                            .resizable()
                            .frame(width: 96, height: 96)
                        
                    }
                        //Red Chips
                        Button{
                            possibleHand(gamble: points, taken: 10)
                            print("Red Chip")
                        }
                    label: {Image("Red Chip")
                            .resizable()
                            .frame(width: 96, height: 96)
                    }
                        //Blue Chips
                        Button{
                            possibleHand(gamble: points, taken: 25)
                            print("Blue Chip")
                        }
                    label: {Image("Blue Chip")
                            .resizable()
                            .frame(width: 96, height: 96)
                    }
                    }
                }
                HStack{
                    //Green Chips
                    Button{
                        possibleHand(gamble: points, taken: 50)
                        print("Green Chip")
                    }
                label: {Image("Green Chip")
                        .resizable()
                        .frame(width: 96, height: 96)
                    
                }
                    //Black Chips
                    Button{
                        possibleHand(gamble: points, taken: 100)
                        print("Black Chip")
                    }
                label: {Image("Black Chip")
                        .resizable()
                        .frame(width: 96, height: 96)
                    
                }
                }
                
            }
        }
        
    }
    //Changes display on the pot based on its amount
    func potChecker() {
        if potAmount >= 1000 {
            pot = "pot 4"
        }
        else if potAmount > 500{
            pot = "pot 3"
        }
        else if potAmount > 250{
            pot = "pot 2"
        }
        else if potAmount > 0{
            pot = "pot 1"
        }
        else if potAmount == 0{
            pot = "pot 0"
        }
    }
    
    //Removes cash from player's hand and add to pot
    func possibleHand(gamble: Int, taken: Int) {
        var test: Int
        test = gamble - taken
        if test >= 0
        {
            points = gamble - taken
            betAmount += taken
            potChecker()
        }
    }
    
    func betPot() {
        potAmount += betAmount
        betAmount = 0
        potChecker()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

