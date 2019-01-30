//
//  ViewController.swift
//  icebox
//
//  Created by Jesús Tirado on 1/18/19.
//  Copyright © 2019 com.tiradoJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol  {
    
    //Properties
    var myIndex = 0
    var feedItems: NSArray = NSArray()
    var selectedFreezer : FreezerModel = FreezerModel()
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "statusFreezer"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: FreezerModel = feedItems[indexPath.row] as! FreezerModel
        // Get references to labels of cell
        myCell.textLabel!.text = item.name
        
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Set selected location to var
        selectedFreezer = feedItems[indexPath.row] as! FreezerModel
        // Manually call segue to detail view controller
        self.performSegue(withIdentifier: "DetailFreezer", sender: self)
        
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //        // Get reference to the destination view controller
    //        let detailVC  = segue.destination as! DetailViewController
    //
    //    }
    
}


