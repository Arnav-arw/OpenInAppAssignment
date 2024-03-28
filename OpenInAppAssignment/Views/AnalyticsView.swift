//
//  AnalyticsView.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import SwiftUI

struct AnalyticsView: View {
    
    var dashboard: DashboardResponseModel
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    AnalyticCardView(
                        cardImage: .todayClicks,
                        cardValue: "\(dashboard.today_clicks)",
                        cardSubtitle: "Today's Click"
                    )
                    AnalyticCardView(
                        cardImage: .topLocation,
                        cardValue: "\(dashboard.top_location)",
                        cardSubtitle: "Top Location"
                    )
                    AnalyticCardView(
                        cardImage: .topSource,
                        cardValue: "\(dashboard.top_source)",
                        cardSubtitle: "Top Source"
                    )
                }
                .padding(.leading)
            }
            ViewAllButton(image: .analyticIcon, title: "View Analytics") {
                
            }
        }
    }
}
