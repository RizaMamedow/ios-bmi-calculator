//
//  AboutAuthorView.swift
//  BMI Calculator
//
//  Created by Riza Mamedov on 28.04.2024.
//

import SwiftUI

struct AboutAuthorView: View {
    @State var degreesRotating: CGFloat = 0;
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    VStack(alignment: .leading){
                        Text("I'am Riza")
                            .font(.largeTitle.bold().monospaced())
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                    Image("Logo")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .trailing)
                        .cornerRadius(.infinity)
                        .rotationEffect(.degrees(degreesRotating))
                        .onAppear {
                          withAnimation(.linear(duration: 1)
                              .speed(0.1).repeatForever(autoreverses: false)) {
                                  degreesRotating = 360.0
                              }
                        }
                    Text("I'm Riza, I live in Ashgabat. I am 17 years old. and I'm a programmer. this application is my exploration into the world of iOS development")
                        .padding()
                        .font(.body.monospaced())
                    
                    socialLinks()
                }
            }
            .navigationTitle("About author")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    func socialLinks() -> some View {
        VStack{
            HStack{
                Link(destination: URL(string: "https://t.me/krugleshock")!){
                    Text("Telegram")
                }
                Link(destination: URL(string: "https://www.instagram.com/krugleshock/")!){
                    Text("Instagram")
                }
                Link(destination: URL(string: "https://github.com/RizaMamedow")!){
                    Text("GitHub")
                }
                Link(destination: URL(string: "mailto://riza.mamedow22@gmail.com")!){
                    Text("My eMail")
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct AboutAuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAuthorView()
    }
}
