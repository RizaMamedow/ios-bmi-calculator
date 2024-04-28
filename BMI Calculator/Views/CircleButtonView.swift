//
//  CircleButtonView.swift
//  BMI Calculator
//
//  Created by Riza Mamedov on 23.04.2024.
//

import SwiftUI


/// A button that takes an action and an icon corresponding to the **CircleButtonIcon** type.
struct CircleButtonView: View {
    /// Icon of the button.
    var icon: CircleButtonIcon
    
    /// Action that doesn't return anything.
    var callback: () -> Void
    
    /// The body of the button, nothing interesting.
    var body: some View {
        Button {
            self.callback()
        } label: {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.black.opacity(0.0))
                .background{
                    Image(systemName: icon.rawValue)
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                .contentShape(Circle())
                .overlay{
                    Circle()
                        .stroke(.blue, lineWidth: 1.5)
                }
        }
    }
}
