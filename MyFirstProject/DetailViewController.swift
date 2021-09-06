//
//  DetailViewController.swift
//  MyFirstProject
//
//  Created by giovanni modica on 08.06.21.
//

import UIKit

class SelectedImage {
    let name: String
    let index: Int
    let totalPictures: Int
    
    init(name: String, number index: Int, of totalPictures: Int) {
        self.name = name
        self.index = index
        self.totalPictures = totalPictures
    }
    
    func printTitle() -> String{
       return "\(name): picture \(index) over \(totalPictures)"
    }
}

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    //shared variable with MainViewController
    var selectedImage: SelectedImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage?.printTitle()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = true

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad.name)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
}
