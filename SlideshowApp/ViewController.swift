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
    //*self入れる？入れない？
    @objc func changeImagePrev(){
        if nowIndex == 0{
            nowIndex = imageArray.count-1
        }else{
            nowIndex -= 1
        }
        imageView.image = imageArray[nowIndex]
        }
    
    @IBAction func nextImage(_ sender: Any) {
        if self.timer == nil {
        changeImageNext()
        }
    }

    @IBAction func prevImage(_ sender: Any) {
        if self.timer == nil {
        changeImagePrev()
        }
    }
   
    @IBAction func slideImage(_ sender: Any) {
        changeImageNext()
    }
    //もっといいやり方があるはず。changeImageNextを以下のsenderに入れたらバグ発生したので、IBAAction無理やり作った。
    
    @IBAction func slideshowImage(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideImage(_:)), userInfo: nil, repeats: true)
        }
        else{
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    //画像パスの引き渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // segueから遷移先のResultViewControllerを取得する
           let enlargeViewController:EnlargeViewController = segue.destination as! EnlargeViewController
           // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
           enlargeViewController.transimage = imageArray[nowIndex]
        }
    
    
}

