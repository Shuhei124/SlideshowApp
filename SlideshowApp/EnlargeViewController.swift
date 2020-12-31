//
//  EnlargeViewController.swift
//  SlideshowApp
//
//  Created by 豊田修平 on 2020/12/26.
//

import UIKit

class EnlargeViewController: UIViewController {
    @IBOutlet weak var enlarge: UIImageView!
    var transimage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        enlarge.image = transimage
        // Do any additional setup after loading the view.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
