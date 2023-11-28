//
//  Calculator_ViewModel.swift
//  Calculator
//
//  Created by Владислав Лесовой on 17.10.2023.
//

import Foundation
extension Calculator_View{
    @MainActor class Calculator_ViewModel: ObservableObject{
        @Published var currentString: String = "0"
        @Published var firstNum: Float = 0
        @Published var secondNum: Float = 0
        var Operation: CalcFuncButton? = nil
        
        func add_number(_ number: Int) -> Void {
            if currentString.range(of: ".") != nil{
                currentString += String(number)
            }
            else if Float(currentString) == 0 || secondNum == 0{
                currentString = String(number)
                secondNum = Float(currentString)!
            }
            else{
                currentString += String(number)
            }
        }
        func GetPrevious() -> String{
            var prev: String = String(firstNum)
            if let op: CalcFuncButton = Operation{
                return prev + String(op.FunctionType.rawValue)
            }
            return prev
        }
        func DelNumber() -> Void{
            if currentString == "0"{
                return
            }
            else{
                let result = String(currentString.dropLast())
                if result == ""{
                    currentString = "0"
                }
                else{
                    currentString = String(result)
                }
            }
        }
        
        func do_action(operation: CalcFuncButton) -> Void {
            if let op: CalcFuncButton = Operation{
                do{
                    secondNum = Float(currentString) ?? 0
                    let result : (Float, Bool) = op.MakeCalcAction(first: firstNum, second: secondNum)
                    if result.1{
                        firstNum = result.0
                    }
                    else{
                        currentString = "Error"
                        return
                    }
                }
                secondNum = 0
                if firstNum.truncatingRemainder(dividingBy: 1) == 0{
                    currentString = String(Int(firstNum))
                }
                else{
                    currentString = String(firstNum)
                }
            }
            else{
                firstNum = Float(currentString) ?? 0
                currentString = "0"
            }
            Operation = operation
        }
        
        func ResultButton() -> Void{
            if let op: CalcFuncButton = Operation{
                do_action(operation: op)
                Operation = nil
            }
            else{
                firstNum = Float(currentString) ?? 0
                currentString = "0"
            }
        }
        
        func DotButton() -> Void{
            if currentString.range(of:".") == nil {
                if currentString == "0"{
                    currentString += "."
                }
                else{currentString += "."}
            }
        }
        
        func ClearButton() -> Void{
            currentString = "0"
            firstNum = 0
            secondNum = 0
            Operation = nil
        }
        
        func SqrtButton() -> Void{
            firstNum = sqrt(secondNum)
            currentString = String(firstNum)
        }
    }
}
