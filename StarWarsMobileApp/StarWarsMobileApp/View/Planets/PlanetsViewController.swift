//
//  PlanetsViewController.swift
//  StarWarsMobileApp
//
//  Created by Amandeep Kaur on 31/08/21.
//

import UIKit
import CustomerioStarWars

class PlanetsViewController: UIViewController {

    // MARK:- OUTLETS
    @IBOutlet weak var planetsTableView: UITableView!
    
    // MARK:- VARIABLES
    let sdkManager = CIOManager()
    let planetCount = 5
    var planetData : [Planet]?
    let reuseIdentifier = "PlanetsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTable()
        getPlanetsData()
    }
    
    func registerTable() {
        planetsTableView.dataSource = self
        planetsTableView.delegate = self
        planetsTableView.estimatedRowHeight = 110
    }
    
    func getPlanetsData() {
        sdkManager.getPlanets(forCount: planetCount) { planetData in
            
            DispatchQueue.main.async {
                self.planetData = planetData
                self.planetsTableView.reloadData()
            }
        }
    }
}

// MARK:- DATASOURCE
extension PlanetsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planetData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PlanetsTableViewCell
        
        let data = planetData?[indexPath.row]
        cell.planetNameText.text = data?.name
        cell.populationText.text = data?.population
        cell.climateText.text = data?.climate
        
        return cell
    }
}

// MARK:- DELEGATE
extension PlanetsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
