//
//  MultiActionButton.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import SwiftUI

struct MultiActionButton: View {
    
    var image: ImageResource
    var title: String
    var color: ColorResource
    var action: () -> ()
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                HStack {
                    Image(image)
                    Text(title)
                        .foregroundStyle(.titleBlack)
                        .font(.custom("Figtree-Medium", size: 16))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color(color))
                            .opacity(0.12)
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(color), lineWidth: 1)
                            .opacity(0.32)
                            .foregroundStyle(.clear)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
    }
}
