//
//  APIModel.swift
//  GithubSearch
//
//  Created by Henry on 2019/7/4.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation


struct Information :Decodable{
    var name:String?
    var owner:Owner?
    var description: String?
    var stargazers_count: Int?
    var forks_count : Int?

}


struct Owner: Decodable{
    var login: String?
//    var description: String?
//    var stargazersCount: Int?
//    var forksCount : Int?
}
