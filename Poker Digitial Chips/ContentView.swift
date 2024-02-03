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
    @State var pot:String = "pot 0"
    @State var reset:Bool = false
    
    var body: some View {
        ZStack {
                Image("Poker Background")
                    .resizable()
                    .ignoresSafeArea()
            VStack{
                HStack{
                    Button{
                        reset = true
                    }
                label: {Image("Title")
                        .resizable()
                        .frame(width:120, height: 120)
                        .alert(isPresented: $reset) {
                            Alert(title: Text("Do you want to reset the game?"), primaryButton: .default(Text ("Reset")){
                                potAmount = 0
                                points = 500
                                potChecker()
                            }, secondaryButton: .cancel())
                        }
                }
                    Spacer()
                }
                Spacer()
                
                Image(pot)
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Total Pot: $\(potAmount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Text("Cash: $\(points)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                HStack{
                    Button{
                        possibleHand(gamble: points, taken: 1)
                        print("White Chip")
                    }
                label: {Image("White Chip")
                        .resizable()
                        .frame(width: 96, height: 96)
                    
                }
                    Button{
                        possibleHand(gamble: points, taken: 10)
                        print("Red Chip")
                    }
                label: {Image("Red Chip")
                        .resizable()
                        .frame(width: 96, height: 96)
                }
                    Button{
                        possibleHand(gamble: points, taken: 25)
                        print("Blue Chip")
                    }
                label: {Image("Blue Chip")
                        .resizable()
                        .frame(width: 96, height: 96)
                }
                }
                HStack{
                    Button{
                        possibleHand(gamble: points, taken: 50)
                        print("Green Chip")
                    }
                label: {Image("Green Chip")
                        .resizable()
                        .frame(width: 96, height: 96)
                    
                }
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
    //Takes away $ from hand and adds to the pot
    func potChecker() {
        if potAmount > 1000 {
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
    
    func possibleHand(gamble: Int, taken: Int) {
    var test: Int
        test = gamble - taken
        if test >= 0
        {
            points = gamble - taken
            potAmount += taken
            potChecker()
        }
    }

    
        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
