//
//  AllPeopleController.swift
//  Memoria
//
//  Created by Muhamed Hammam on 07/04/2021.
//

import UIKit

class AllPeopleController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func registerCells(){
        allPeopleTVOutlet.registerCellNib(cellClass: AllPeopleCell.self)
//        sliderCollectionViewOutlet.registerCell(cellClass: HomeSlider.self ) //Extension handles sThis
//        tableViewOutlet.registerCellNib(cellClass: HomeTableViewCell.self) //Extension handles sThis
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllPeopleCell") as! AllPeopleCell
      return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }

    @IBOutlet weak var allPeopleTVOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableSetup()
        registerCells()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "All People"

    }

    
    func tableSetup(){
        allPeopleTVOutlet.delegate = self
        allPeopleTVOutlet.dataSource = self
    }

}
