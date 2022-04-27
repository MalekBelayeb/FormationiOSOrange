//
//  ViewController.swift
//  TestiOSProject
//
//  Created by ODC on 26/4/2022.
//

import UIKit

extension ViewController : PlaceNotifier
{
    func showLoading() {
        
        //TODO: show loading implementation
        
        print("show loading ....")
    }
    
    func getAllPlaces(listOfPlaces:[PlaceModel]) {
        
        //TODO: fetch all logic
        
        print("in loading get all places ", listOfPlaces.count)
        
        self.tab = listOfPlaces
        self.tableView.reloadData()
        
        
    }
    
    func hideLoading() {
        //TODO: hide loading implementation
        print("hide Loading")
    }
    
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "MoveTodetail", sender:self.tab[indexPath.row])
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let placeCell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as! PlaceTableViewCell
        
        placeCell.titleLabel.text = self.tab[indexPath.row].name
        placeCell.categoryLabel.text = self.tab[indexPath.row].kinds
        placeCell.distanceLabel.text = self.tab[indexPath.row].dist?.description

        return placeCell
    }
    
    
}

class ViewController: UIViewController  {
    
    var presenter:PlacePresenter = PlacePresenter(placeService: PlaceService())
    
    var tab: [PlaceModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        self.presenter.placeNotifier = self

        
        self.presenter.fetchAllPlaces()
        
        
        tableView.register(UINib.init(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceTableViewCell")
        tableView.reloadData()
        
    
    }
  

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoveTodetail" {
            let destination = segue.destination as! PlaceDetailViewController
            let placeObject = sender as! PlaceModel
            destination.placeModel = placeObject
            
            
            }
    }
    


}

