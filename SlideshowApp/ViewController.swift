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
        //*初期の画面表示をここに入れるのは合っている？
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    /*Segueの時にはコードを書きませんでしたが、戻るためのSegueはコードを書かなくてはいけません。
    この戻るためのSegueの事を「Unwind Segue」と言い、「Unwind Segue」を戻り先のViewControllerに記述する必要があります。
    つまり今回の場合だと「ViewController.swift」に書く必要がある、という事になります。*/
    
    @objc func changeImageNext(){
        if nowIndex == (imageArray.count-1){
            nowIndex = 0
            //最後の画像の表示時に、進むボタンをタップすると、最初の画像が表示
        } else{
            nowIndex += 1
        }
        imageView.image = imageArray[nowIndex]
        }
    //@objcは必要か不要か?
    @objc func changeImagePrev(){
        if nowIndex == 0{
            nowIndex = imageArray.count-1
            //最初の画像の表示時に、戻るボタンをタップすると、最後の画像が表示
        }else{
            nowIndex -= 1
        }
        imageView.image = imageArray[nowIndex]
        }
    
    @IBAction func nextImage(_ sender: Any) {
        if self.timer == nil {
        changeImageNext()
            //*self入れても動くが入れる？入れない？nowIndexも同様
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
    //*changeImageNext()を以下のselectorに入れたらバグ発生したので、fun slideImageを無理やり作ったが、もっといい方法があるはず。(_ sender: Any)が必要?そもそも何か?
    
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
           // 遷移先のResultViewControllerで宣言しているtransimageに値を代入して渡す
           enlargeViewController.transimage = imageArray[nowIndex]
        }
    
    
}

