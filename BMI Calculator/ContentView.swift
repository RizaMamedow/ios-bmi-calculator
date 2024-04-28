//
//  ContentView.swift
//  BMI Calculator
//
//  Created by Riza Mamedov on 23.04.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = .init()
    @Namespace private var animation
    
    @State private var showPopup: Bool = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    Text("Enter your personal details")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ]
                    ){
                        SectionView(
                            header: "Height",
                            value: $viewModel.height,
                            suffix: "cm",
                            plusButtonCallback: viewModel.incrementHeight,
                            minusButtonCallback: viewModel.decrementHeight
                        )
                        
                        SectionView(
                            header: "Weight",
                            value: $viewModel.weight,
                            suffix: "kg",
                            plusButtonCallback: viewModel.incrementWeight,
                            minusButtonCallback: viewModel.decrementWeight
                        )
                    }
                }
            }
            .navigationTitle("BMI Calculator")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Button{
                        showPopup.toggle()
                    } label: {
                        Text("About me")
                    }
                }
            }
            .overlay(alignment: .bottom) {
                Button{
                    viewModel.openResultView()
                } label: {
                    Text("Calculate")
                        .font(.title2.bold())
                        .foregroundColor(.black)
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .background(.yellow, in: Capsule())
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity)
            }
            .popover(isPresented: $viewModel.showResults){
                ResultView()
                    .environmentObject(viewModel)
            }
            .popover(isPresented: $showPopup){
                AboutAuthorView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
