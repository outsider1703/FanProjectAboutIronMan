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
        
    func fetchData() {
        guard let url = URL(string: jsonURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                self.contents = try decoder.decode(SuperHero.self, from: data)
                DispatchQueue.main.async {
                    self.transitionSelection()
                }
            } catch  let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

extension ContentViewController {
    private func transitionSelection() {
        switch selection {
        case "powerstats":
            contentLabel.text = """
            Powerstats:
            Intelligence: \(contents.powerstats?.intelligence ?? 0)
            Strength: \(contents.powerstats?.strength ?? 0)
            Speed: \(contents.powerstats?.speed ?? 0)
            Durability: \(contents.powerstats?.durability ?? 0)
            Power: \(contents.powerstats?.power ?? 0)
            Combat: \(contents.powerstats?.combat ?? 0)
"""
        case "apperance":
            contentLabel.text = """
            Apperance:
            Gender: \(contents.appearance?.gender ?? "")
            Race: \(contents.appearance?.race ?? "")
            Height: \(contents.appearance?.height?.last ?? "")
            Weight: \(contents.appearance?.weight?.last ?? "")
            EyeColor:\(contents.appearance?.eyeColor ?? "")
            HairColor:\(contents.appearance?.hairColor ?? "")
"""
        case "biography":
            contentLabel.text = """
            Biography:
            FullName: \(contents.biography?.fullName ?? "")
            AlterEgos: \(contents.biography?.alterEgos ?? "")
            Aliases: \(contents.biography?.aliases?.last ?? "")
            PlaceOfBirth: \(contents.biography?.placeOfBirth ?? "")
            FirstAppearance: \(contents.biography?.firstAppearance ?? "")
            Publisher: \(contents.biography?.publisher ?? "")
            Occupation: \(contents.work?.occupation ?? "")
            Base: \(contents.work?.base ?? "")
            GroupAffiliation: \(contents.connections?.groupAffiliation ?? "")
            Relatives: \(contents.connections?.relatives ?? "")

"""
        default:
            break
        }
    }
}










