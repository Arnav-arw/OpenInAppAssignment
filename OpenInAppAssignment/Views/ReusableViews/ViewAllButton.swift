//
//  ViewAllButton.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import SwiftUI

struct ViewAllButton: View {
    
    var image: ImageResource
    var title: String
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
                }
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.subtitle), lineWidth: 1)
                        .foregroundStyle(.clear)
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
    }
}
