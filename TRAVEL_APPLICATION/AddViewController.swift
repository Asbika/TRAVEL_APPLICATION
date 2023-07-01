//
//  AddViewController.swift
//  NewVille
//
//  Created by Asbika Hicham on 6/4/23.
//

import UIKit


protocol UserDataDelegate {
    func didSelectUserData(imageLink: String,descriptionField : String,
                           cityName:String,countryName: String)
}
class AddViewController: UIViewController {
    var userDataDelegate :UserDataDelegate?

    @IBOutlet weak var imageLink: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var countryName: UITextField!
    @IBOutlet weak var cityName: UITextField!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addButton(_ sender: Any) {
        userDataDelegate?.didSelectUserData(imageLink: imageLink.text!, descriptionField: descriptionField.text!, cityName: cityName.text!, countryName: countryName.text!)
        dismiss(animated: true, completion: nil)
    }
  
}
