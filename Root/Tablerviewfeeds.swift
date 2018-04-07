////
////  Tablerviewfeeds.swift
////  Patch
////
////  Created by Shashi Kumar P on 4/7/18.
////  Copyright © 2018 therootproject. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//struct JSONData: Decodable {
//
//    let pk: Int?
//    let name: String?
//    let description: String?
//    let lat: String?
//    let lng: String?
//    let website: URL?
//
//    private enum CodingKeys: String, CodingKey {
//
//        case pk
//        case name
//        case description
//        case lat
//        case lng
//        case website
//    }
//}
//
//    class FoodBank_Table: UITableViewController {
//
//        var banks = [JSONData]()
//
//        override func viewDidLoad() {
//            fetchJSON()
//
//        }
//
//        fileprivate func fetchJSON() {
//            let urlString = "https://thedeepend.herokuapp.com/api/banks/?format=json"
//            guard let url = URL(string: urlString) else { return }
//            URLSession.shared.dataTask(with: url) { (data, _, err) in
//                DispatchQueue.main.async {
//                    if let err = err {
//                        print("Failed to get data from url:", err)
//                        return
//                    }
//
//                    guard let data = data else { return }
//
//                    do {
//                        // link in description for video on JSONDecoder
//                        let decoder = JSONDecoder()
//                        // Swift 4.1
//                        decoder.dateDecodingStrategy = .convertFromSnakeCase
//
//                        self.banks = try decoder.decode([JSONData].self, from: data)
//                        self.tableView.reloadData()
//                    } catch let jsonErr {
//                        print("Failed to decode:", jsonErr)
//                    }
//                }
//                }.resume()
//
//        }
//
//        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return banks.count
//        }
//
//        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//            let cell = FoodBank_Table_cell(style: .subtitle, reuseIdentifier: "FoodBank_Table_cell")
//            let bankspath = banks[indexPath.row]
//            cell.companyname?.text = bankspath.name
//            // To be determined
//
//            return cell
//        }
//
//
//    }
//
//    class Gardenstable: UITableViewController {
//        var gardens = [JSONData]()
//
//        override func viewDidLoad() {
//
//            fetchJSON()
//
//        }
//
//        fileprivate func fetchJSON() {
//            let urlString = "https://thedeepend.herokuapp.com/api/banks/?format=json"
//            guard let url = URL(string: urlString) else { return }
//            URLSession.shared.dataTask(with: url) { (data, _, err) in
//                DispatchQueue.main.async {
//                    if let err = err {
//                        print("Failed to get data from url:", err)
//                        return
//                    }
//
//                    guard let data = data else { return }
//
//                    do {
//                        // link in description for video on JSONDecoder
//                        let decoder = JSONDecoder()
//                        // Swift 4.1
//                        decoder.dateDecodingStrategy = .convertFromSnakeCase
//                        self.gardens = try decoder.decode([JSONData].self, from: data)
//                        self.tableView.reloadData()
//                    } catch let jsonErr {
//                        print("Failed to decode:", jsonErr)
//                    }
//                }
//                }.resume()
//
//        }
//
//        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = PostHaverest(style: .subtitle, reuseIdentifier: "gardencell")
//            let gardenatpath = gardens[indexPath.row]
//            cell.textLabel?.text = gardenatpath.name
//            cell.detailTextLabel?.text = String(gardenatpath.description!)
//
//
//            return cell
//        }
//
//        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return gardens.count
//        }
//
//}
//
