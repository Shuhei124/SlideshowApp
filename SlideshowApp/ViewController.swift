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
    // タイマー
    var timer: Timer!
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
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
    @objc func changeImageNext(){
        if nowIndex == (imageArray.count-1){
            nowIndex = 0
        } else{
            nowIndex += 1
        }
        imageView.image = imageArray[nowIndex]
        }

    @objc func changeImagePrev(){
        if nowIndex == 0{
            nowIndex = imageArray.count-1
        }else{
            nowIndex -= 1
        }
        imageView.image = imageArray[nowIndex]
        }
    
    @IBAction func nextImage(_ sender: Any) {
        changeImageNext()
    }

    @IBAction func prevImage(_ sender: Any) {
        changeImagePrev()
    }
    
    
    @IBAction func slideshowImage(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(nextImage(_:)), userInfo: nil, repeats: true)
        }
        else{
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    
}

