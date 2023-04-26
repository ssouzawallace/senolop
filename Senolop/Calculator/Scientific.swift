//
//  Scientific.swift
//  Senolop
//
//  Created by Wallace Silva on 25/10/22.
//

import Foundation

//extension RPN {
//    mutating func yxPressed() {
//        guard let elementA = stack.popLast() else { return }
//        guard let elementB = stack.popLast() else { return }
//        stack.append(Item(value: pow(elementA.value, elementB.value)))
//    }
//    
//    mutating func sqrtPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: sqrt(element.value)))
//    }
//    
//    mutating func inversePressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: 1/(element.value)))
//    }
//    
//    mutating func xFactorialPressed() {
//        guard let _ = stack.popLast() else { return }
//        // FIXME: calcular fatorial
////        stack.append(Item(value: Double(Int(element.value).fact())))
//    }
//    
//    mutating func x2Pressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: pow(element.value, 2)))
//    }
//    
//    mutating func x3Pressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: pow(element.value, 3)))
//    }
//    
//    mutating func sqrt3Pressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: pow(element.value, 1/3)))
//    }
//    
//    mutating func sqrtyxPressed() {
//        guard let elementA = stack.popLast() else { return }
//        guard let elementB = stack.popLast() else { return }
//        stack.append(Item(value: pow(elementA.value, 1/elementB.value)))
//    }
//
//    mutating func sinPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: sin(element.value)))
//    }
//    
//    mutating func sinInvPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: (element.value)))
//    }
//    
//    mutating func sinhPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: sinh(element.value)))
//    }
//    
//    mutating func sinhInvPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: asinh(element.value)))
//    }
//    
//    mutating func cosPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: cos(element.value)))
//    }
//    
//    mutating func cosInvPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: acos(element.value)))
//    }
//    
//    mutating func coshPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: cosh(element.value)))
//    }
//    
//    mutating func coshInvPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: acosh(element.value)))
//    }
//    
//    mutating func tanPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: tan(element.value)))
//    }
//    
//    mutating func tanInvPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: atanh(element.value)))
//    }
//    
//    mutating func tanhPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: tanh(element.value)))
//    }
//    
//    mutating func tanhInvPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: tanh(element.value)))
//    }
//    
//    mutating func randPressed() {
//        stack.append(Item(value: Double(arc4random())))
//    }
//    
//    mutating func radPressed() {
//        // FIXME: // FIXME: 
//    }
//    
//    mutating func degPressed() {
//        // FIXME: c
//    }
//    
//    mutating func twoPoweredByXPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: pow(element.value, 2)))
//    }
//    
//    mutating func tenPoweredByXPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: pow(element.value, 10)))
//    }
//    
//    mutating func xPoweredByYPressed() {
//        guard let elementA = stack.popLast() else { return }
//        guard let elementB = stack.popLast() else { return }
//        stack.append(Item(value: pow(elementA.value, elementB.value)))
//    }
//    
//    mutating func log2Pressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: log2(element.value)))
//    }
//    
//    mutating func log10Pressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: log10(element.value)))
//    }
//    
//    mutating func ePressed() {
//        stack.append(Item(value: exp(1)))
//    }
//    
//    mutating func piPressed() {
//        stack.append(Item(value: Double.pi))
//    }
//    
//    mutating func lognPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: log(element.value)))
//    }
//    
//    mutating func ePoweredByXPressed() {
//        guard let element = stack.popLast() else { return }
//        stack.append(Item(value: log10(element.value)))
//    }
//    
//    mutating func lnyPressed() {
//        
//    }
//    
//    mutating func mcPressed() {
//        
//    }
//    
//    mutating func mrPressed() {
//        
//    }
//    
//    mutating func mPlusPressed() {
//        
//    }
//    
//    mutating func mMinusPressed() {
//        
//    }
//    
//    mutating func eePressed() {
//        
//    }
//}
