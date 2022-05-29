//
//  Home.swift
//  App_Ticket
//
//  Created by moon on 5/28/22.
//

import UIKit

class HomeController: UIViewController{
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    var imgArr:[String] = ["img1", "img2", "img3"]
    var timer:Timer?
    var currentCellIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
//        pageView.currentPage = 0
        pageView.numberOfPages = imgArr.count
    }
    
    @objc func slideToNext() {
        if currentCellIndex < imgArr.count-1 {
            currentCellIndex = currentCellIndex + 1
        } else {
            currentCellIndex = 0
        }
        pageView.currentPage = currentCellIndex
        sliderCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }
}
extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionView
        cell.myImage.image = UIImage(named: imgArr[indexPath.row])
        cell.layer.cornerRadius = 50.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
}
