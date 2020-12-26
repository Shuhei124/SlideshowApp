//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 豊田修平 on 2020/12/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    
    var nowIndex:Int = 0
    
    var imageArray:[UIImage] = [
        UIImage(named: "img01.jpg")!,
        UIImage(named: "img02.jpg")!,
        UIImage(named: "img03.jpg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imageArray[0]
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    @objc func changeImage(){
        imageView.image = imageArray[nowIndex]
    }
    
    
    
}

