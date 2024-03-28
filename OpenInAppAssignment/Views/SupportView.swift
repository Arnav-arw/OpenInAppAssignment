//
//  SupportView.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import SwiftUI

struct SupportView: View {
    
    var dashboard: DashboardResponseModel
    
    var body: some View {
        VStack {
            MultiActionButton(image: .whatsappIcon, title: "Talk with us", color: .whatsapp) {
                if let url = URL(string: "wa.me/\(dashboard.support_whatsapp_number)") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            MultiActionButton(image: .questionIcon, title: "Frequently Asked Questions", color: .question) {
                 
            }
        }
    }
}
