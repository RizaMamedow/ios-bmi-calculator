//
//  BMIRatingMessage.swift
//  BMI Calculator
//
//  Created by Riza Mamedov on 24.04.2024.
//

import Foundation
import SwiftUI

/// Result of the body mass index
struct BMIRatingMessage {
    var message: String
    var color: Color
    
    /// - Parameters:
    ///     - message: Incoming message
    ///     - color: Message color
    init (message: String, color: Color){
        self.message = message
        self.color = color
    }
}
