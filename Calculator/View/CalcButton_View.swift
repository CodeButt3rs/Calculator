//
//  CalcButton_View.swift
//  Calculator
//
//  Created by Владислав Лесовой on 17.10.2023.
//

import SwiftUI

struct CalcButton_View: View {
    var symbol: Character
    var color: String
    var transparency: Float = 1.0
    var act: () -> Void
    init(symbol: Character, color: String, action: @escaping () -> Void) {
        self.symbol = symbol
        self.color = color
        self.act = action
    }
    var body: some View {
        Button(action: {act()}, label: {
            ZStack{
                Circle()
                    .fill(Color(color))
                    .frame(width: 75, height: 75)
                Text(String(symbol))
                    .font(.custom("Roboto", size: 36))
                    .foregroundColor(.black)
                }
        })
    }
}

#Preview {
    CalcButton_View(symbol: "+", color: "Buttons Color 1", action: {print(1)})
}
