//
//  HomePage.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject private var dashboardVM = DashboardViewModel()
    
    var body: some View {
        VStack {
            dashboardHeader
            dashboardContent
        }
        .background {
            Color.blue
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height)
                .ignoresSafeArea(.all)
        }
    }
    
    @ViewBuilder
    private var dashboardHeader: some View {
        HStack {
            Text("Dashboard")
                .foregroundStyle(Color(.titleWhite))
                .font(.custom("Figtree-SemiBold", size: 24))
            Spacer()
            Button {
                
            } label: {
                Image(.settingButton)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
        }
        .padding([.horizontal, .bottom])
    }
    
    @ViewBuilder
    private var dashboardContent: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                WelcomeView()
                if let dashboardStats = dashboardVM.dashboardStats {
                    AnalyticsView(dashboard: dashboardStats)
                    ListLinkView(dashboard: dashboardStats)
                    SupportView(dashboard: dashboardStats)
                } else {
                    ProgressView()
                        .padding(.top, 250)
                }
            }
        }
        .background {
            Color(.background)
                .frame(width: UIScreen.main.bounds.width)
                .clipShape(.rect(cornerRadius: 16, style: .continuous))
                .ignoresSafeArea(.all)
        }
    }
    
}

#Preview {
    DashboardView()
}
