//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by E5000866 on 28/05/24.
//

import Foundation

enum TipCalculatorError: Error {
    case invalidInput
}


class TipCalculator {
    
    func calculate (total:Double , tipPercentage: Double) throws -> Double {
        
        if total<0 {
            throw TipCalculatorError.invalidInput
        }
        return total * tipPercentage
    }
    
    
}
