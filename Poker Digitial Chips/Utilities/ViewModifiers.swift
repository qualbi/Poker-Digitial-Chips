//
//  ViewModifiers.swift
//  Poker Digitial Chips
//
//  Created by Kevin Bui on 2/9/24.
//

import SwiftUI

//Checks to see if iOS is correct for display
struct NavStackContainer: ViewModifier{
    func body(content: Content) -> some View {
        if #available(iOS 16, *){
            NavigationStack {
                content
            }
        } else {
            NavigationView {
                content
            }
            .navigationViewStyle(.stack)
        }
    }
}

extension View {
    public func inNavigationStack() -> some View {
        return self.modifier(NavStackContainer())
    }
}
