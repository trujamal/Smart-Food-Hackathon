//
//  ViewController.swift
//  Root
//
//  Created by Grayson on 4/6/18.
//  Copyright © 2018 therootproject. All rights reserved.
//

import UIKit

class HomePageClass: UIViewController {
    
    // Setting up


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        guard let gitUrl = URL(string: "http://serveraddress.com") else { return }

        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            
            guard let data = data else { return }
            do {
                
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(JSONData.self, from: data)
                
                
                
                DispatchQueue.main.sync {
                    if let gimage = gitData.avatarUrl {
                        let data = try? Data(contentsOf: gimage)
                        let image: UIImage = UIImage(data: data!)!
//                        self.gravatarImage.image = image
                    }
                    
                    
                    if let gname = gitData.name {
//                        self.name.text = gname
                    }
                    if let glocation = gitData.location {
//                        self.location.text = glocation
                    }
                    
                    if let gfollowers = gitData.followers {
//                        self.followers.text = String(gfollowers)
                    }
                    
                    if let grepos = gitData.repos {
//                        self.blog.text = String(grepos)
                    }
//                    self.setLabelStatus(value: false)
                }
                
            } catch let err {
                print("Err", err)
            }
            }.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

