//
//  ResultView.swift
//  BMI Calculator
//
//  Created by Riza Mamedov on 24.04.2024.
//

import SwiftUI


/// ``ResultView`` - View of the *BMI* result screen. The result is calculated in the `Types/Result` structure.
struct ResultView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    @Environment(\.self) var env
    
    var body: some View {
        let bmiRating: BMIRatingMessage = viewModel.result.getBMIRating()
        
        NavigationView{
            ScrollView {
                VStack {
                    Text(viewModel.result.getRoundedBMI())
                        .font(.system(size: 80).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("> \(bmiRating.message)")
                        .font(.title.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                .foregroundColor(bmiRating.color)
                
                Divider()
                
                VStack{
                    Text("Full BMI point: \(viewModel.result.getBMI())")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Your Weight: \(viewModel.weight)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Your Height: \(viewModel.height)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .font(.callout)
            }
            .navigationTitle("Results")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
