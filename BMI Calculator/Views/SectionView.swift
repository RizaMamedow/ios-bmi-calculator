//
//  SectionView.swift
//  BMI Calculator
//
//  Created by Riza Mamedov on 24.04.2024.
//

import SwiftUI

/// View for sections to avoid repeating the same code multiple times.
struct SectionView: View {
    /// Header of the section.
    var header: String
    
    /// Value of the section.
    @Binding var value: Int
    
    /// Unit of measurement.
    /// Wanted to write "postfix" but it's already a reserved word.
    var suffix: String
    
    /// Callbacks for the section, specifically for the plus and minus buttons.
    var plusButtonCallback: () -> Void
    var minusButtonCallback: () -> Void
    
    /// The body of the section, nothing interesting, just a basic section with no design decisions.
    var body: some View {
        VStack(spacing: 10){
            Text("\(header)")
                .font(.title)
            HStack{
                Text("\(self.value) \(self.suffix)")
                    .font(.title2)
                    
            }
            .padding(.vertical, 5)
            HStack(spacing: 20){
                CircleButtonView(icon: .minus) {
                    self.minusButtonCallback()
                }
                
                CircleButtonView(icon: .plus) {
                    self.plusButtonCallback()
                }
            }
        }
        .padding(25)
        .padding(.horizontal)
        .background(.thinMaterial)
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
