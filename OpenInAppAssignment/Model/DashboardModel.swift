//
//  DashboardModel.swift
//  OpenInAppAssignment
//
//  Created by Arnav Singhal on 28/03/24.
//

import Foundation

struct DashboardResponseModel: Codable {
    let status: Bool
    let statusCode: Int
    let message: String
    let support_whatsapp_number: String
    let extra_income: Double
    let total_links: Int
    let total_clicks: Int
    let today_clicks: Int
    let top_source: String
    let top_location: String
    let startTime: String
    let links_created_today: Int
    let applied_campaign: Int
    let data: DashboardData
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case statusCode = "statusCode"
        case message = "message"
        case support_whatsapp_number = "support_whatsapp_number"
        case extra_income = "extra_income"
        case total_links = "total_links"
        case total_clicks = "total_clicks"
        case today_clicks = "today_clicks"
        case top_source = "top_source"
        case top_location = "top_location"
        case startTime = "startTime"
        case links_created_today = "links_created_today"
        case applied_campaign = "applied_campaign"
        case data = "data"
    }
}

struct DashboardData: Codable {
    let recent_links : [Links]?
    let top_links : [Links]?
    let favourite_links : [String]?
    //    let overall_url_chart : Overall_url_chart?
    
    enum CodingKeys: String, CodingKey {
        
        case recent_links = "recent_links"
        case top_links = "top_links"
        case favourite_links = "favourite_links"
        //        case overall_url_chart = "overall_url_chart"
    }
    
}


struct Links: Codable, Identifiable {
    var id: Int { url_id }
    let url_id: Int
    let web_link: String
    let smart_link: String
    let title: String
    let total_clicks: Int
    let original_image: String?
    let thumbnail: String?
    let times_ago: String?
    let created_at: String?
    let domain_id: String?
    let url_prefix: String?
    let url_suffix: String?
    let app: String?
    let is_favourite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case url_id = "url_id"
        case web_link = "web_link"
        case smart_link = "smart_link"
        case title = "title"
        case total_clicks = "total_clicks"
        case original_image = "original_image"
        case thumbnail = "thumbnail"
        case times_ago = "times_ago"
        case created_at = "created_at"
        case domain_id = "domain_id"
        case url_prefix = "url_prefix"
        case url_suffix = "url_suffix"
        case app = "app"
        case is_favourite = "is_favourite"
    }
    
}
