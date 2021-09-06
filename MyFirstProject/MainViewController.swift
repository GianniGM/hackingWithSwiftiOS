//
//  ViewController.swift
//  MyFirstProject
//
//  Created by giovanni modica on 07.06.21.
//

import UIKit

/*
 this is the difference between android and iOS, in Android we first fire an activity
 and once is loaded we pass the Intent as a messaging sistem once it is created
 in iOS though, we first instantiate the view controller object, we pass the data and then
 we push it
*/

//extra functionality for tables UITableViewController than UIViewController
class MainViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm view"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fileManager = FileManager.default
        
        //resourcePath our main bundle always have resource path
        let path = Bundle.main.resourcePath!
        
        //it's right that it's crashes because we have to read something here
        let contentOfResource = try! fileManager.contentsOfDirectory(atPath: path)
        
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
        //indexPath is the row number
        
        //dequeueReusableCell is a recycleview
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "PictureName",
            for: indexPath
        )
        cell.textLabel?
            .text = "Picture \(indexPath.row) is \(pictures[indexPath.row])"
        return cell
    }
    
    
    //handle selections of the item
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        /* on iOS
         1. we create (instantiate) the viewController first
         2. we pass the data we need in the following View
         3. we show up the everything in the navigation controller
         */
        
        /* on Android
         1. we launch an intent, it will provide to create the Activity
         2. we create the UI
         3. we fetch the data passed from the previous activity
         */
        
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
