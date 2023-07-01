//
//  ViewController.swift
//  NewVille
//
//  Created by Asbika Hicham on 6/3/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UserDataDelegate,UserDataDelegate2{
    
    @IBAction func addButton(_ sender: Any) {
        let vcUserData = self.storyboard?.instantiateViewController(identifier: "userDataID") as! AddViewController
        
            vcUserData.userDataDelegate = self
            present(vcUserData, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    @IBOutlet weak var myTableView: UITableView!

     static var villeTab = [Ville(image: "1.png", city : "Paris",country : "France",description : "New York City is known for its bustling atmosphere, diverse culture, and iconic landmarks. It is composed of five boroughs: Manhattan, Brooklyn, Queens, The Bronx, and Staten Island. Each borough has its own unique character and attractions.Manhattan, the heart of the city, is famous for its towering skyscrapers, including the renowned Empire State Building, One World Trade Center, and Times Square. It is home to many iconic neighborhoods such as Central Park, Greenwich Village, SoHo, and Wall Street. Broadway, located in the Theater District, is renowned for its world-class theatrical productions.Brooklyn, situated across the East River from Manhattan, has a distinct personality. It offers a vibrant arts and music scene, trendy neighborhoods like Williamsburg and DUMBO, and the iconic Coney Island amusement park."),Ville(image: "1.png", city : "NewYork",country : "USA",description : "New York City is known for its bustling atmosphere, diverse culture, and iconic landmarks. It is composed of five boroughs: Manhattan, Brooklyn, Queens, The Bronx, and Staten Island. Each borough has its own unique character and attractions.Manhattan, the heart of the city, is famous for its towering skyscrapers, including the renowned Empire State Building, One World Trade Center, and Times Square. It is home to many iconic neighborhoods such as Central Park, Greenwich Village, SoHo, and Wall Street. Broadway, located in the Theater District, is renowned for its world-class theatrical productions.Brooklyn, situated across the East River from Manhattan, has a distinct personality. It offers a vibrant arts and music scene, trendy neighborhoods like Williamsburg and DUMBO, and the iconic Coney Island amusement park.")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.villeTab.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! homeTableViewCell
        cell.setupCell(photo : UIImage(named: ViewController.villeTab[indexPath.row].image)!, name : ViewController.villeTab[indexPath.row].city, cntryName :ViewController.villeTab[indexPath.row].country)
    return cell
    }
    
    func didSelectUserData(imageLink: String, descriptionField: String, cityName: String, countryName: String) {
        let newVille = Ville.init(image: imageLink, city: cityName, country: countryName, description: descriptionField)
        ViewController.villeTab.append(newVille)
        myTableView.reloadData()
    }
    func didSelectUserData2(imageLink: String, descriptionField: String, cityName: String, countryName: String,indxx: Int) {
        let updatedVille = Ville.init(image: imageLink, city: cityName, country: countryName, description: descriptionField)
        ViewController.villeTab[indxx] = updatedVille
        myTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "seg"{
            if let indexPath = myTableView.indexPathForSelectedRow{
                let destinationVC = segue.destination as! MyViewController
                destinationVC.ville = ViewController.villeTab[indexPath.row]
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
            ViewController.villeTab.remove(at: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (_, _, completionHandler) in
            let vcUserData2 = self.storyboard?.instantiateViewController(identifier: "userDataID2") as! EditViewController
            
            vcUserData2.userDataDelegate2 = self
            vcUserData2.cityNM = ViewController.villeTab[indexPath.row].city
            vcUserData2.countryNM = ViewController.villeTab[indexPath.row].country
            vcUserData2.desc = ViewController.villeTab[indexPath.row].description
            vcUserData2.img = ViewController.villeTab[indexPath.row].image
            vcUserData2.indx = indexPath.row
            self.present(vcUserData2, animated: true, completion: nil)
            completionHandler(true)
        }
        editAction.backgroundColor = .green
        editAction.image = UIImage(systemName: "pencil")

        let configuration = UISwipeActionsConfiguration(actions: [editAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }

    
    
    
}

