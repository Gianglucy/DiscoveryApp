//
//  APIConfiguration.swift
//  DiscoveryApp
//
//  Created by Apple on 6/19/21.
//

import Foundation
import Alamofire

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
}
