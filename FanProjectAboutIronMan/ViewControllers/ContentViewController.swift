//
//  ContentViewController.swift
//  FanProjectAboutIronMan
//
//  Created by Macbook on 21.06.2020.
//  Copyright © 2020 Igor Simonov. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet var contentLabel: UILabel!
    
    private let jsonURL = "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/id/346.json"
    private var contents: SuperHero!
    
    var selection: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func fetchData() {
        guard let url = URL(string: jsonURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                self.contents = try decoder.decode(SuperHero.self, from: data)
                DispatchQueue.main.async {
                    
                    self.contentLabel.text = self.contents.biography?.fullName
                }
                print(self.contents.biography ?? "")
            } catch  let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

//extension ContentViewController {
//    private func transitionSelection() {
//        switch selection {
//        case "powerstats":
//            contentLabel.text = """
//            Powerstats:
//            Intelligence: \(contents.powerstats?.intelligence ?? 0)
//            Strength: \(contents.powerstats?.strength ?? 0)
//            Speed: \(contents.powerstats?.speed ?? 0)
//            Durability: \(contents.powerstats?.durability ?? 0)
//            Power: \(contents.powerstats?.power ?? 0)
//            Combat: \(contents.powerstats?.combat ?? 0)
//"""
//        case "apperance":
//            contentLabel.text = """
//            let gender: \(contents.apperance?.gender ?? "")
//            let race: \(contents.apperance?.race ?? "")
//            let height: \(contents.apperance?.height?.last ?? "")
//            let weight: \(contents.apperance?.weight?.last ?? "")
//            let eyeColor:\(contents.apperance?.eyeColor ?? "")
//            let hairColor:\(contents.apperance?.hairColor ?? "")
//
//"""
//
//        case "biography":
//            contentLabel.text = """
//"""
//
//        default:
//            break
//        }
//    }
//}
//









