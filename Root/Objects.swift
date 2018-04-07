//
//  Users.swift
//  Root
//
//  Created by Jamal on 4/6/18.
//  Copyright © 2018 therootproject. All rights reserved.
//

import Foundation
import UIKit

struct JSONData: Decodable {
    
    let name: String?
    let location: String?
    let followers: Int?
    let avatarUrl: URL?
    let repos: Int?
    
    private enum User: String, CodingKey {
        case name
        case location
        case followers
        case repos = "public_repos"
        case avatarUrl = "avatar_url"
        
    }
    
    private enum Garden: String, CodingKey {
        case name
        case location
        case followers
        case repos = "public_repos"
        case avatarUrl = "avatar_url"
        
    }
    
    private enum Food_Banks: String, CodingKey {
        case name
        case location
        case followers
        case repos = "public_repos"
        case avatarUrl = "avatar_url"
        
    }
    
    
}

fileprivate func fetchJSON() {
    guard let urlString = URL(string: "https://thedeepend.herokuapp.com/api/gardens/?format=json") else { return }
    URLSession.shared.dataTask(with: urlString) { (data,_ ,err ) in
        DispatchQueue.main.async {
            if let err = err {
                print("failed to get data fro url:" , err)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                self._ = try decoder.decode([JSONData].self, from: data) // IMPLEMENT LINE
                self.tableView.reloadData()
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }
    }.resume()
}

/**
 Food Banks { Need to include options for claiming food)
    Request / Post (Needs priority option for which food is requried
 Community Gardens
    Input Inventory
    Create New Gardens
    Share Feature
    Location

 Phase 1: Linking Community Gardens to Foodbanks
 Phase 2: Lack of gardens "Request new Locations'
 Phase 3: Incorparate Personal Gardens Availbe to donate
 Phase 4: Employee food insecurity workers
 
 Database Logic
 _________________________________________________________________
 {
 "pk": 2,
 "name": "Gardden 1",
 "photo": "image url",
 "description": "Some description",
 "products": [
 {
 "pk": 1,
 "name": "Lettuce",
 "photo": "image_url",
 "description": "some description",
 }
 ],
 "location": [
 17.75390625,
 0.263671875
 ]
 }
 
*/

/**
 Sample
 _________________________________________________________________
 {
 "login": "Shashikant86",
 "id": 683799,
 "avatar_url": "https://avatars0.githubusercontent.com/u/683799?v=4",
 "gravatar_id": "",
 "url": "https://api.github.com/users/Shashikant86",
 "html_url": "https://github.com/Shashikant86",
 "followers_url": "https://api.github.com/users/Shashikant86/followers",
 "following_url": "https://api.github.com/users/Shashikant86/following{/other_user}",
 "gists_url": "https://api.github.com/users/Shashikant86/gists{/gist_id}",
 "starred_url": "https://api.github.com/users/Shashikant86/starred{/owner}{/repo}",
 "subscriptions_url": "https://api.github.com/users/Shashikant86/subscriptions",
 "organizations_url": "https://api.github.com/users/Shashikant86/orgs",
 "repos_url": "https://api.github.com/users/Shashikant86/repos",
 "events_url": "https://api.github.com/users/Shashikant86/events{/privacy}",
 "received_events_url": "https://api.github.com/users/Shashikant86/received_events",
 "type": "User",
 "site_admin": false,
 "name": "Shashikant",
 "company": "@AOL, @BBC, @PhotoBox",
 "blog": "http://shashikantjagtap.net",
 "location": "London",
 "email": null,
 "hireable": null,
 "bio": "Author of BDDfire & XCFit. DevOps Automation iOS Swift PHP Ruby Development. CI&CD[Jenkins, Docker, AWS, Xcode Server] BDD[Cucumber Behat Cucumberish, Fitnesse]",
 "public_repos": 124,
 "public_gists": 1,
 "followers": 138,
 "following": 55,
 "created_at": "2011-03-22T12:39:11Z",
 "updated_at": "2018-04-03T06:08:10Z"
 }
 
 
 
 
 */
