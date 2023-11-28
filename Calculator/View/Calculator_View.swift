//
//  Calculator_View.swift
//  Calculator
//
//  Created by Владислав Лесовой on 17.10.2023.
//

import SwiftUI

struct Calculator_View: View {
    @StateObject var CalcVM = Calculator_ViewModel()
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .foregroundStyle(Color.white)
                        .border(.indigo)
                    VStack{
                        Text(String(CalcVM.GetPrevious()))
                            .foregroundStyle(.gray)
                            .padding()
                        Text(CalcVM.currentString)
                    }
                }
            }
            .gesture(DragGesture().onEnded({ value in
                if value.translation.width < 0 {
//                    print("DO")
                    CalcVM.DelNumber()
                }
            }))
            .ignoresSafeArea()
            VStack{
                HStack(spacing: 15, content: {
                    CalcButton_View(symbol: "1", color: "Buttons Color 1", action: {CalcVM.add_number(1)})
                    CalcButton_View(symbol: "2", color: "Buttons Color 1", action: {CalcVM.add_number(2)})
                    CalcButton_View(symbol: "3", color: "Buttons Color 1", action: {CalcVM.add_number(3)})
                    CalcButton_View(symbol: "+", color: "Buttons Color 2", action: {CalcVM.do_action(operation: CalcButtonAdd())})
                }
                )
                HStack(spacing: 15, content: {
                    CalcButton_View(symbol: "4", color: "Buttons Color 1", action: {CalcVM.add_number(4)})
                    CalcButton_View(symbol: "5", color: "Buttons Color 1", action: {CalcVM.add_number(5)})
                    CalcButton_View(symbol: "6", color: "Buttons Color 1", action: {CalcVM.add_number(6)})
                    CalcButton_View(symbol: "-", color: "Buttons Color 2", action: {CalcVM.do_action(operation: CalcButtonSubstract())})
                }
                )
                HStack(spacing: 15, content: {
                    CalcButton_View(symbol: "7", color: "Buttons Color 1", action: {CalcVM.add_number(7)})
                    CalcButton_View(symbol: "8", color: "Buttons Color 1", action: {CalcVM.add_number(8)})
                    CalcButton_View(symbol: "9", color: "Buttons Color 1", action: {CalcVM.add_number(9)})
                    CalcButton_View(symbol: "*", color: "Buttons Color 2", action: {CalcVM.do_action(operation: CalcButtonMultiply())})
                }
                )
                HStack(spacing: 15, content: {
                    CalcButton_View(symbol: "0", color: "Buttons Color 1", action: {CalcVM.add_number(0)})
                    CalcButton_View(symbol: "/", color: "Buttons Color 2", action: {CalcVM.do_action(operation: CalcButtonDivide())})
                    CalcButton_View(symbol: "^", color: "Buttons Color 2", action: {CalcVM.do_action(operation: CalcButtonPower())})
                    CalcButton_View(symbol: "=", color: "Buttons Color 2", action: {CalcVM.ResultButton()})
                }
                )
                HStack(spacing: 15, content: {
                    CalcButton_View(symbol: ".", color: "Buttons Color 2", action: {CalcVM.DotButton()})
                    CalcButton_View(symbol: "C", color: "Buttons Color 2", action: {CalcVM.ClearButton()})
                    CalcButton_View(symbol: "√", color: "Buttons Color 2", action: {CalcVM.SqrtButton()})
                }
                )
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Calculator_View()
}
