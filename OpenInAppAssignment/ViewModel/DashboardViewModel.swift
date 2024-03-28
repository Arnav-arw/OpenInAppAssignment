//
//  DashboardViewModel.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import Foundation

class DashboardViewModel: ObservableObject {
    
    @Published var dashboardStats: DashboardResponseModel?
    
    let networkManager = NetworkManager()
    
    init() {
        fetchDashboard()
    }
    
    private func fetchDashboard() {
        Task {
            let data = await networkManager.fetchdashboard()
            if let data {
                DispatchQueue.main.async {
                    self.dashboardStats = data
                }
            }
        }
    }
    
}
