//
//  AnalyticCardView.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import SwiftUI

struct AnalyticCardView: View {
    
    var cardImage: ImageResource
    var cardValue: String
    var cardSubtitle: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(.white)
            .frame(width: 120, height: 120)
            .overlay {
                VStack(alignment: .leading) {
                    Image(cardImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.bottom, 15)
                    Text(cardValue)
                        .foregroundColor(Color(.titleBlack))
                        .font(.custom("Figtree-SemiBold", size: 16))
                        .lineLimit(1)
                    Text(cardSubtitle)
                        .foregroundColor(Color(.subtitle))
                        .font(.custom("Figtree-Regular", size: 14))
                        .lineLimit(1)
                }
            }
    }
}
