//
//  WebImage.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import SwiftUI

struct WebImage: View {
    
    var url: String?
    
    var body: some View {
        GeometryReader { geo in
            if let url {
                AsyncImage(url: URL(string: url)) { image in
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(.rect(cornerRadius: 8))
                } placeholder: {
                    ProgressView()
                        .centerToArea()
                        .opacity(0.3)
                }
            } else {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
            }
        }
    }
}

#Preview {
    WebImage(url: "https://assets.nobroker.in/nb-new/public/List-Page/ogImage.png")
        .frame(width: 50, height: 50)
}
