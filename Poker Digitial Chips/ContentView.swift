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
    
    var body: some View {
        ZStack {
                Image("Poker Background")
                    .resizable()
                    .ignoresSafeArea()
            VStack{
                HStack{
                    Button{
                        
                    }
                label: {Image("Title")
                        .resizable()
                        .frame(width:120, height: 120)
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
                        
                    }
                label: {Image("White Chip")
                        .resizable()
                        .frame(width: 96, height: 96)
                    
                }
                    Button{
                        
                    }
                label: {Image("Red Chip")
                        .resizable()
                        .frame(width: 96, height: 96)
                }
                    Button{
                        
                    }
                label: {Image("Blue Chip")
                        .resizable()
                        .frame(width: 96, height: 96)
                }
                }
                HStack{
                    Button{
                        
                    }
                label: {Image("Green Chip")
                        .resizable()
                        .frame(width: 96, height: 96)
                    
                }
                    Button{
                        
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
    }
        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
