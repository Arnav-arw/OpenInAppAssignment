//
//  Extentions.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import SwiftUI

extension View {
    func centerToArea() -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                self
                Spacer()
            }
            Spacer()
        }
    }
}

extension String {
    func convertDateString() -> String {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFullDate, .withDashSeparatorInDate]
        if let date = dateFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "d MMMM yyyy"
            outputFormatter.locale = Locale(identifier: "en_US_POSIX")
            return outputFormatter.string(from: date)
        }
        return "Date not available"
    }
}
