//
//  WelcomeView.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(getGreeting())
                .foregroundStyle(Color(.subtitle))
                .font(.custom("Figtree-Regular", size: 16))
            Text("Arnav Singhal👋")
                .foregroundStyle(Color(.titleBlack))
                .font(.custom("Figtree-SemiBold", size: 24))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 30)
        .padding(.leading)
    }
    
    func getGreeting() -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        switch hour {
            case 0..<5:
                return "Good night"
            case 5..<12:
                return "Good morning"
            case 12..<17:
                return "Good afternoon"
            default:
                return "Good evening"
        }
    }
}
