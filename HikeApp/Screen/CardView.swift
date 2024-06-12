//
//  CardView.swift
//  HikeApp
//
//  Created by Sreysros Leak on 9/6/24.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK - HEADER
                VStack(alignment: .leading) {
                    HStack {
                    Text("Hiking")
                        .fontWeight(.black)
                        .font(.system(size: 52))
                        .foregroundStyle(
                            LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                        )
                        Spacer()
                    Button(action: {
                        isShowingSheet.toggle()
                    }, label: {
                        CustomButtonView()
                    })
                    .sheet(isPresented: $isShowingSheet, content: {
                        SettingView()
//                            .presentationDragIndicator(.visible)
//                            .presentationDetents([.medium, .large])
                    })
                    }
                    
                    Text("Fun and enjoyable outdoor activities for friends and family.")
                        .foregroundColor(.customGrayMedium)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 16, weight: .regular, design: .default).italic())
                }.padding(.horizontal, 20)
                // MARK - MAIN CONTENT
            
            ZStack {
                CustomCircleView()
                
                Image("image-\(imageNumber)")
                    .resizable()
                    .scaledToFit()
                    .animation(.default, value: imageNumber)
            }
                
                Button(action: {
                    randomImage()
                }, label: {
                    Text("Explore More")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
//                        .padding()
                        
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .fill(
                                LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .top, endPoint: .bottom)
                                )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                    
                })
                .buttonStyle(GradientButton())
        }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
