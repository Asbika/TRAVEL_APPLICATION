//
//  EditViewController.swift
//  NewVille
//
//  Created by Asbika Hicham on 6/4/23.
//

import UIKit
protocol UserDataDelegate2 {
    func didSelectUserData2(imageLink: String,descriptionField : String,
                            cityName:String,countryName: String,indxx: Int)
}
class EditViewController: UIViewController {
    
    var userDataDelegate2 :UserDataDelegate2?
    var cityNM : String = ""
    var countryNM : String = ""
    var desc : String = ""
    var img : String = ""
    var indx : Int?
    @IBOutlet weak var myCityName: UITextField!
    @IBOutlet weak var myDescriptionName: UITextField!
    @IBOutlet weak var myCountryName: UITextField!
    @IBOutlet weak var myImageLink: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        myCityName.text = cityNM
        myCountryName.text = countryNM
        myDescriptionName.text = desc
        myImageLink.text = img
        // Do any additional setup after loading the view.
    }
    @IBAction func saveButton(_ sender: Any) {
        userDataDelegate2?.didSelectUserData2(imageLink: myImageLink.text!, descriptionField: myDescriptionName.text!, cityName: myCityName.text!, countryName: myCountryName.text!,indxx: indx!)
        dismiss(animated: true, completion: nil)
    }
}
