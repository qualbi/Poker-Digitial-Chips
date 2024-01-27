//
//  ContentView.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 1/26/24.
//

import SwiftUI

struct ContentView: View {
    
    var potAmount:Int = 0
    var points:Int = 500
    var pot:String = "pot 4"
    
    var body: some View {
        ZStack {
            Image("Poker Background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Image("Title")
                    .resizable()
                    .frame(width:200, height: 195)
                
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
        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
