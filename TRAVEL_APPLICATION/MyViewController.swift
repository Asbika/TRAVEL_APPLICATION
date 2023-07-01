//
//  MyViewController.swift
//  NewVille
//
//  Created by Asbika Hicham on 6/4/23.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myCity: UILabel!
    @IBOutlet weak var myCountry: UILabel!
    @IBOutlet weak var myDescription: UILabel!
  
    var ville: Ville!
    override func viewDidLoad() {
        super.viewDidLoad()
        myCity.text = (ville!.city)
        myImage.image = UIImage(named:"\(ville!.image)")
        myCountry.text = ville!.country
        myDescription.text = ville!.description
    }

}
