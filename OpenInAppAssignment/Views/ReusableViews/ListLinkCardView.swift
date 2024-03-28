//
//  ListLinkCardView.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import SwiftUI

struct ListLinkCardView: View {
    
    var link: Links
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                WebImage(url: link.original_image)
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 5) {
                    Text(link.web_link)
                        .foregroundStyle(.titleBlack)
                        .font(.custom("Figtree-Regular", size: 14))
                        .lineLimit(1)
                        .onTapGesture {
                            if let url = URL(string: link.web_link) {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                    Text(link.created_at?.convertDateString() ?? "")
                        .foregroundStyle(.subtitle)
                        .font(.custom("Figtree-Regular", size: 12))
                }
                Spacer()
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(link.total_clicks)")
                        .foregroundStyle(.titleBlack)
                        .font(.custom("Figtree-SemiBold", size: 14))
                    Text("Clicks")
                        .foregroundStyle(.subtitle)
                        .font(.custom("Figtree-Regular", size: 12))
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 15)
            .background(Color.white)
            Rectangle()
                .foregroundStyle(.accentBlue)
                .opacity(0.2)
                .frame(height: 40)
                .overlay {
                    HStack {
                        Text(link.smart_link)
                            .foregroundStyle(.accentBlue)
                            .lineLimit(1)
                            .onTapGesture {
                                if let url = URL(string: link.smart_link) {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                }
                            }
                        Spacer()
                        Button {
                            UIPasteboard.general.string = link.smart_link
                        } label: {
                            Image(.copyButton)
                        }
                    }
                    .padding(.horizontal, 15)
                }
        }
        .clipShape(.rect(cornerRadius: 8))
        .padding(.horizontal)
    }
}
