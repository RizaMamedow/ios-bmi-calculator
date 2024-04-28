//
//  DoubleExtension.swift
//  BMI Calculator
//
//  Created by Riza Mamedov on 28.04.2024.
//

import Foundation


extension Float {
    /// Rounds the float to decimal places value
    /// 
    /// - Parameters:
    ///  - toPlaces: point to clip long Float  Value
    ///
    /// - Returns: nicely rounded float value
    func rounded(toPlaces places: Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
