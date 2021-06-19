//
//  ResponseError.swift
//  DiscoveryApp
//
//  Created by Apple on 6/19/21.
//

import Foundation
import Alamofire

class ResponseError: Codable, Error {
    var statusCode: Int?
    var statusMessage: String?
    var success: Bool?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}
