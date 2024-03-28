//
//  ChartView.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    let londonWeatherData = 
    [
        WeatherData(year: 2024, month: 1, day: 1, temperature: 25),
        WeatherData(year: 2024, month: 2, day: 1, temperature: 35),
        WeatherData(year: 2024, month: 3, day: 1, temperature: 80),
        WeatherData(year: 2024, month: 4, day: 1, temperature: 75),
        WeatherData(year: 2024, month: 5, day: 1, temperature: 100),
        WeatherData(year: 2024, month: 6, day: 1, temperature: 50),
        WeatherData(year: 2024, month: 7, day: 1, temperature: 25),
        WeatherData(year: 2024, month: 8, day: 1, temperature: 100)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Overview")
                    .foregroundStyle(.subtitle)
                    .font(.custom("Figtree-Regular", size: 14))
                Spacer()
                HStack {
                    Text("Jan 24 - Aug 24")
                        .foregroundStyle(.titleBlack)
                        .font(.custom("Figtree-Regular", size: 12))
                    Image(systemName: "clock")
                        .resizable()
                        .foregroundStyle(.gray)
                        .frame(width: 12, height: 12)
                }
                .padding(.all, 5)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        .opacity(0.5)
                        .foregroundStyle(.clear)
                }
            }
            .padding(.bottom, 10)
            Chart {
                ForEach(londonWeatherData) { item in
                    LineMark(
                        x: .value("Month", item.date),
                        y: .value("Temp", item.temperature)
                    )
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) { value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.abbreviated))
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartPlotStyle { plotArea in
                plotArea
                    .background(.blue.opacity(0.05))
            }
            .frame(height: 150)
        }
        .padding(.all, 10)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 8))
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    ChartView()
}

struct WeatherData: Identifiable {
    let id = UUID()
    let date: Date
    let temperature: Double
    
    init(year: Int, month: Int, day: Int, temperature: Double) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.temperature = temperature
    }
}
