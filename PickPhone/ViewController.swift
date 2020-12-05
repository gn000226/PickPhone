//
//  ViewController.swift
//  PickPhone
//
//  Created by 陳暘璿 on 2020/11/19.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var lbPhone: UILabel!
    @IBOutlet weak var bt12Pro: UIButton!
    @IBOutlet weak var btSe: UIButton!
    @IBOutlet weak var bt12: UIButton!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var colorCollectionViewFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var ivPhoneBackground: UIImageView!
    @IBOutlet weak var phoneColorView: UIView!
    //var phonesImageArray: UIImage!
    //cell要的顏色
    let colorArray = [ #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 0.65), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 0.65), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 0.65), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.65), #colorLiteral(red: 0.8980392157, green: 0.4235294118, blue: 0.4117647059, alpha: 0.65), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.65), #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.65), #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 0.65), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 0.65), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 0.65), #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) ]
    //顏色名
    let colorString = [ "大西洋藍","共九桃","印度洋藍","李太黑","韓粉","無腦綠","歐瑞橘","潘迎紫","地中海藍","綠豆黃","沒顏色" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        /* 預設底圖 **/
        self.ivPhoneBackground.image = UIImage(named: "iphone-12-pro-Back")
        //宣告UIImage及UIImageView，並給與
        let image12Pro = UIImage(named: "iphone-12-pro-Color")
        let colorImageView = UIImageView(image: image12Pro)
        colorImageView.contentMode = .scaleAspectFit //.contentMode > 填滿內容
        //將phoneColorView的尺寸給colorImageView，使其限制位置尺寸跟phoneColorView相同
        colorImageView.frame = phoneColorView.bounds
        //設定背景顏色(就是要調整的手機顏色)為全透明
        phoneColorView.backgroundColor = UIColor(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 0))
        phoneColorView.mask = colorImageView    //.mask > 遮罩，遮色片
    }
    /* 設定collectionView長度 **/
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        11
    }
    /* 設定collectionCell的內容 **/
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //宣告cell > 透過Identifier:取得剛剛建立的cell程式
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhoneCollectionViewCell", for: indexPath) as! PhoneCollectionViewCell
        //顯示顏色在cell上面
        cell.pickColorView.backgroundColor = colorArray[indexPath.item]
        return cell
    }    
    /* 點擊cell換顏色動作 **/
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let colorIndex = indexPath.item   //取得點擊的indexPath.item
        let color = colorArray[colorIndex]   //取該indexPath.item的顏色
        let string = colorString[colorIndex]    //取該indexPath.item的顏色名字
        if colorIndex == 10 {   //假如點擊最後的item，顯示預設底圖
            phoneColorView.backgroundColor = UIColor(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 0))
            self.lbPhone.text = string  //設定顏色名
            self.lbPhone.textColor = color  //設定文字顏色
        } else {    //否則顯示選擇到的顏色及顏色名
            phoneColorView.backgroundColor = color
            self.lbPhone.text = string
            self.lbPhone.textColor = color
        }
    }
    /* 點擊顯示圖片12Pro **/
    @IBAction func select12Pro(_ sender: UIButton) {
        self.ivPhoneBackground.image = UIImage(named: "iphone-12-pro-Back")
        let image12Pro = UIImage(named: "iphone-12-pro-Color")
        let colorImageView = UIImageView(image: image12Pro)
        colorImageView.contentMode = .scaleAspectFit
        colorImageView.frame = phoneColorView.bounds
        phoneColorView.backgroundColor = UIColor(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 0))
        phoneColorView.mask = colorImageView    //.mask > 遮罩
        
        self.lbPhone.text = "iPhone12Pro"
        self.lbPhone.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    /* 點擊顯示圖片Se **/
    @IBAction func selectSe(_ sender: UIButton) {
        self.ivPhoneBackground.image = UIImage(named: "iphone-se")
        let imageSe = UIImage(named: "iphone-se-Color")
        //程式建立imageView >
        let colorImageView = UIImageView(image: imageSe)
        colorImageView.contentMode = .scaleAspectFit    //.contentMode > 填滿內容
        //將phoneColorView的尺寸給colorImageView，使其限制尺寸跟phoneColorView相同
        colorImageView.frame = phoneColorView.bounds
        phoneColorView.backgroundColor = UIColor(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 0))
        phoneColorView.mask = colorImageView    //.mask > 遮罩
        
        self.lbPhone.text = "iPhoneSE"
        self.lbPhone.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    /* 點擊顯示圖片12 **/
    @IBAction func select12(_ sender: UIButton) {
        self.ivPhoneBackground.image = UIImage(named: "iphone-12-Back")
        let image12 = UIImage(named: "iphone-12-Color")
        let colorImageView = UIImageView(image: image12)
        colorImageView.contentMode = .scaleAspectFit
        colorImageView.frame = phoneColorView.bounds
        phoneColorView.backgroundColor = UIColor(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 0))
        phoneColorView.mask = colorImageView

        self.lbPhone.text = "iPhone12"
        self.lbPhone.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
}

