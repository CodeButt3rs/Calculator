//
//  Calc_Utils.swift
//  Calculator
//
//  Created by Владислав Лесовой on 17.10.2023.
//

import Foundation

enum CalcOperation: Character{
    case Add = "+"
    case Substract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Power = "^"
    case Result = "="
    case Sqrt = "√"
}

protocol CalcFuncButton{
    var FunctionType: CalcOperation { get set }
    func MakeCalcAction(first: Float, second: Float) -> (Float, Bool)
}

struct CalcButtonAdd: CalcFuncButton{
    var FunctionType: CalcOperation = CalcOperation.Add
    
    func MakeCalcAction(first: Float, second: Float) -> (Float, Bool) {
        if Float(first + second).isFinite{
            return (first + second, true)
        }
        else{
            return (-1, false)
        }
    }
}

struct CalcButtonSubstract: CalcFuncButton{
    var FunctionType: CalcOperation = CalcOperation.Substract
    
    func MakeCalcAction(first: Float, second: Float) -> (Float, Bool) {
        if Float(first - second).isFinite{
            return (first - second, true)
        }
        else{
            return (-1, false)
        }
    }
}

struct CalcButtonDivide: CalcFuncButton{
    var FunctionType: CalcOperation = CalcOperation.Divide
    
    func MakeCalcAction(first: Float, second: Float) -> (Float, Bool) {
        if Float(first / second).isFinite{
            if(second == 0){
                return (-1, false)
            }
            return (first / second, true)
        }
        else{
            return (-1, false)
        }
    }
}

struct CalcButtonMultiply: CalcFuncButton{
    var FunctionType: CalcOperation = CalcOperation.Multiply
    
    func MakeCalcAction(first: Float, second: Float) -> (Float, Bool) {
        if Float(first * second).isFinite{
            return (first * second, true)
        }
        else{
            return (-1, false)
        }
    }
}

struct CalcButtonPower: CalcFuncButton{
    var FunctionType: CalcOperation = CalcOperation.Power
    
    func MakeCalcAction(first: Float, second: Float) -> (Float, Bool) {
        if Float(pow(Double(first), Double(second))).isFinite{
            return (Float(pow(Double(first), Double(second))), true)
        }
        else{
            return (-1, false)
        }
    }
}

struct CalcButtonSqrt: CalcFuncButton{
    var FunctionType: CalcOperation = CalcOperation.Power
    
    func MakeCalcAction(first: Float, second: Float) -> (Float, Bool) {
        if Float(sqrt(second)).isFinite{
            return (sqrt(second), true)
        }
        else{
            return (-1, false)
        }
    }
}
