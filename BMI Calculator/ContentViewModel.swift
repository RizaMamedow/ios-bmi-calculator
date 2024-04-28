//
//  ContentViewModel.swift
//  BMI Calculator
//
//  Created by Riza Mamedov on 23.04.2024.
//

import Foundation

/// ViewModel of the application containing logical operations such as increment, decrement, and similar.
class ContentViewModel: ObservableObject {
    /// User's height
    @Published var height: Int = 170
    
    /// Increment user's height ``height``
    func incrementHeight() -> Void { self.height += 1 }
    
    /// Decrement user's height ``height``
    func decrementHeight() -> Void {
        if self.height > 1 {
            self.height -= 1
        }
    }
    
    /// User's weight
    @Published var weight: Int = 70
    
    /// Increment user's weight ``weight``
    func incrementWeight() -> Void { self.weight += 1 }
    
    /// Decrement user's weight ``weight``
    func decrementWeight() -> Void {
        if self.weight > 10 {
            self.weight -= 1
        }
    }
    
    /// Boolean value for opening ``ResultView`` and for closing it.
    @Published var showResults: Bool = false
    
    /// Opens ``ResultView``
    func openResultView() -> Void { showResults = true }
    /// Closes ``ResultView``
    func closeResultView() -> Void { showResults = false }
    
    func getResult() -> Result {
        return Result.init(self.weight, self.height)
    }
    
    var result: Result {
        Result.init(self.weight, self.height)
    }
}
