//
//  Result.swift
//  BMI Calculator
//
//  Created by Riza Mamedov on 24.04.2024.
//

import Swift
import Foundation

/// # BMI Formula
/// The formula for calculating BMI looks like this:
/// ``BMI = weight / height^2``
/// which means weight divided by height squared.

/// - Summary:
///   Function to square a number.
///
/// - Parameters:
///     - val: A **floating-point** number.
///
/// - Returns:
///     The number squared.
private func getSquare<T: Numeric & Comparable>(_ val: T) -> T { return val * val }


/// - Summary:
///   Function to convert an integer from centimeters to meters.
///
/// - Parameters:
///     - val: An integer number.
///
/// - Returns:
///     A **floating-point** number.
private func centimeterToMeter(_ val: Float) -> Float { return val / 100 }


/// BMI Result where all calculations occur.
struct Result {
    var weight: Int
    var height: Int
    
    /// Initialization of the BMI result structure.
    ///
    /// - Parameters:
    ///     - weight: User's weight.
    ///     - height: User's height.
    init(
        _ weight: Int,
        _ height: Int
    ){
        self.weight = weight
        self.height = height
    }
    
    /// Private static method that calculates BMI.
    ///
    /// - Parameters:
    ///     - weight: Weight.
    ///     - height: Height.
    ///
    /// - Returns:
    ///     Rounded integer value.
    private static func computeBMI(_ weight: Int, _ height: Int) -> Float {
        let squaredHeight: Float = getSquare(centimeterToMeter(Float(height)))
        let floatedWeight: Float = Float(weight)
        
        return floatedWeight / squaredHeight
    }
    
    /// Method that calls another method ``computeBMI()`` and passes the instance data to it to return the calculated BMI result.
    ///
    /// - Returns:
    ///     Rounded integer BMI result.
    func getBMI() -> Float{
        return Result.computeBMI(self.weight, self.height)
    }
    
    func getRoundedBMI() -> String {
        return String(getBMI().rounded(toPlaces: 1))
    }
    
    /// Method that returns the BMI rating ``BMIRatingMessage`` depending on what ``getBMI()`` returns and selects the BMI rating.
    ///
    /// - Returns:
    ///     ``BMIRatingMessage`` BMI rating.
    func getBMIRating() -> BMIRatingMessage {
        switch self.getBMI() {
            case 16...19:
                return BMIRatingMessage(
                    message: "Insufficient (deficit) body weight",
                    color: .mint
                )
            case 19...25:
                return BMIRatingMessage(
                    message: "Weight norm",
                    color: .green
                )
            case 25...30:
                return BMIRatingMessage(
                    message: "Excess body weight (pre-obesity)",
                    color: .orange.opacity(0.9)
                )
            case 30...35:
                return BMIRatingMessage(
                    message: "Obesity of the first degree",
                    color: .orange
                )
            case 35...40:
                return BMIRatingMessage(
                    message: "Obesity of the second degree",
                    color: .red.opacity(0.8)
                )
            case 40...:
                return BMIRatingMessage(
                    message: "Obesity of the third degree (morbid)",
                    color: .red
                )
            
            default:
                return BMIRatingMessage(
                    message:  "Undefined Error",
                    color: .red
                )
        }
    }
}
