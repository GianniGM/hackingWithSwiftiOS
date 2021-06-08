//
//  ViewController.swift
//  MyFirstProject
//
//  Created by giovanni modica on 07.06.21.
//

import UIKit

//extra functionality for tables UITableViewController than UIViewController
class MainViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let contentOfResource = try! fileManager
            .contentsOfDirectory(atPath: path)
        
        for item in contentOfResource {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
    }
    
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return pictures.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        //dequeueReusableCell is a recycleview
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Picture",
            for: indexPath
        )
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    
}

