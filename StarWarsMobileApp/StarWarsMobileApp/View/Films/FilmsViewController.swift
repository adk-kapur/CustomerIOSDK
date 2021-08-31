//
//  FilmsViewController.swift
//  StarWarsMobileApp
//
//  Created by Amandeep Kaur on 29/08/21.
//

import UIKit
import CustomerioStarWars

class FilmsViewController: UIViewController {
    
    // MARK:- OUTLETS
    @IBOutlet weak var filmsTableView: UITableView!
    
    // MARK:- VARIABLES
    let sdkManager = CIOManager()
    let reuseIdentifier = "FilmsTableViewCell"
    var filmsData : FilmsResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableCells()
        getFilmsData()
    }
    
    func registerTableCells() {
        
        filmsTableView.dataSource = self
        filmsTableView.delegate = self
        filmsTableView.estimatedRowHeight = 110
    }
    
    func getFilmsData() {
        sdkManager.getAllFilms { response in
            
            DispatchQueue.main.async {
                if let _ = response {
                    self.filmsData = response
                    self.filmsTableView.reloadData()
                }
            }
        }
    }
}

// MARK:- DATASOURCE
extension FilmsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FilmsTableViewCell
        
        let data = filmsData?.results?[indexPath.row]
        cell.filmTitle.text = data?.title
        cell.filmOpenCrawl.text = data?.opening_crawl
        cell.filmReleaseInfo.text = data?.release_date
        
        return cell
    }
}

// MARK:- DELEGATE
extension FilmsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
