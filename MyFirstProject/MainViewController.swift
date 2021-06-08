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
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        //create a DetailViewController (Activity in android)
        if let viewController = storyboard?.instantiateViewController(
            withIdentifier: "Detail"
        ) as? DetailViewController {
            //if it is found then pass the image
            viewController.selectedImage = pictures[indexPath.row]
            
            //now the view is ready, we can push the controller and launch it
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

/*
 this is the difference between android and iOS, in Android we first fire an activity
 and once is loaded we pass the Intent as a messaging sistem once it is created
 in iOS though, we first instantiate the view controller object, we pass the data and then
 we push it
*/
