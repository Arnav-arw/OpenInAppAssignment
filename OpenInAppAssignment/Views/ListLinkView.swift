//
//  ListLinkView.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import SwiftUI

struct ListLinkView: View {
    
    var dashboard: DashboardResponseModel
    
    @State var selectedLinks: LinkModel = .topLinks
    
    @State var searchbutton: Bool = false
    @State var searchTerm: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    selectedLinks = .topLinks
                } label: {
                    Text("Top Links")
                        .foregroundStyle(selectedLinks == .topLinks ? .titleWhite : .titleBlack)
                        .font(.custom("Figtree-Medium", size: 16))
                        .padding(.all, 10)
                        .background(selectedLinks == .topLinks ? .accentBlue : .clear)
                        .clipShape(.capsule)
                }
                Button {
                    selectedLinks = .recentLinks
                } label: {
                    Text("Recent Links")
                        .foregroundStyle(selectedLinks == .recentLinks ? .titleWhite : .titleBlack)
                        .font(.custom("Figtree-Medium", size: 16))
                        .padding(.all, 10)
                        .background(selectedLinks == .recentLinks ? .accentBlue : .clear)
                        .clipShape(.capsule)
                }
                Spacer()
                Button {
                    searchbutton.toggle()
                } label: {
                    Image(.searchButton)
                        .resizable()
                        .frame(width: 36, height: 36)
                }
            }
            .padding(.horizontal)
            if searchbutton {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $searchTerm)
                        .foregroundStyle(.titleBlack)
                        .font(.custom("Figtree-Medium", size: 16))
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.subtitle), lineWidth: 1)
                        .foregroundStyle(.clear)
                }
                .padding(.horizontal)
                .onChange(of: searchTerm) { oldValue, newValue in
                    
                }
            }
            switch selectedLinks {
                case .topLinks:
                    ScrollView(showsIndicators: false) {
                        if let topLinks = dashboard.data.top_links {
                            ForEach(topLinks) { link in
                                ListLinkCardView(link: link)
                            }
                        }
                    }
                case .recentLinks:
                    ScrollView(showsIndicators: false) {
                        if let recentLinks = dashboard.data.recent_links {
                            ForEach(recentLinks) { link in
                                ListLinkCardView(link: link)
                            }
                        }
                    }
            }
            ViewAllButton(image: .analyticIcon, title: "View Analytics") {
                
            }
        }
        .padding(.top)
    }
}
