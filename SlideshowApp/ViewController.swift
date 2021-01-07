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
        var timer:Timer!
        @IBOutlet weak var fwdButton: UIButton!
        @IBOutlet weak var prevButton: UIButton!
        @IBOutlet weak var startstopButton: UIButton!
       
        
        var imageArray:[UIImage] = [
            UIImage(named: "img01.jpg")!,
            UIImage(named: "img02.jpg")!,
            UIImage(named: "img03.jpg")!
        ]

        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            imageView.image = imageArray[0]
            startstopButton.setTitle("再生", for: .normal)
            //*初期の画面表示をここに入れるのは合っている？→あっている(質問回答)
            
            
        }

        @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }
        
        @objc func changeImageNext(){
            if nowIndex == (imageArray.count-1){
                nowIndex = 0
                //最後の画像の表示時に、進むボタンをタップすると、最初の画像が表示
            } else{
                nowIndex += 1
            }
            imageView.image = imageArray[nowIndex]
            }
        
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

        
        @IBAction func slideshowImage(_ sender: Any) {
            if timer == nil {
                timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(changeImageNext), userInfo: nil, repeats: true)
        //selectorの中にはobjectiveCを入れる必要があるので、その関数の前には@objcをつける必要がある(質問回答)
        //timerの前のselfは見にくくなるのでいらない。(質問回答)
                fwdButton.isEnabled = false
                prevButton.isEnabled = false
                fwdButton.setTitleColor(UIColor.gray, for: .normal)
                prevButton.setTitleColor(UIColor.gray, for: .normal)
                startstopButton.setTitle("停止", for: .normal)
            }
            else{
                timer.invalidate()
                timer = nil
                fwdButton.isEnabled = true
                prevButton.isEnabled = true
                fwdButton.setTitleColor(UIColor.systemBlue, for: .normal)
                prevButton.setTitleColor(UIColor.systemBlue, for: .normal)
                startstopButton.setTitle("再生", for: .normal)
            }
        }
        
        //画像パスの引き渡し
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のResultViewControllerを取得する
            let enlargeViewController:EnlargeViewController = segue.destination as! EnlargeViewController
            // 遷移先のResultViewControllerで宣言しているtransimageに値を代入して渡す
            enlargeViewController.transimage = imageArray[nowIndex]
            if timer == nil {
            }
            else{
            timer.invalidate()
            timer = nil
            fwdButton.isEnabled = true
            prevButton.isEnabled = true
            fwdButton.setTitleColor(UIColor.systemBlue, for: .normal)
            prevButton.setTitleColor(UIColor.systemBlue, for: .normal)
            startstopButton.setTitle("再生", for: .normal)
            }
        
        
    }
    }
