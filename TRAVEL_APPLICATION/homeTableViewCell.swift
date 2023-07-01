//
//  homeTableViewCell.swift
//  NewVille
//
//  Created by Asbika Hicham on 6/3/23.
//

import UIKit

class homeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cityImage: UIImageView!
 
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    
    func setupCell(photo : UIImage, name : String, cntryName :String){
        cityImage.image = photo
        cityName.text = name
        countryName.text = cntryName
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
