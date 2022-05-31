//
//  Home.swift
//  App_Ticket
//
//  Created by moon on 5/28/22.
//
import SideMenu
import UIKit
@IBDesignable
class HomeController: UIViewController, MenuControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
    private var sideMenu: SideMenuNavigationController?
    private let accountController = AccountController()
    private let listTicketController = ListTicketController()
    private let logoutController = LoginController()
    
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    var imgArr:[String] = ["img1", "img2", "img3"]
    var timer:Timer?
    var currentCellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Menu
        let menu = MenuController(with: ["Tài Khoản", "Danh Sách Vé Đặt", "Đăng Xuất"])
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.rightMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        addChildController()
        
        //Slider
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
//        pageView.currentPage = 0
        pageView.numberOfPages = imgArr.count
    }
        
    
    @IBAction func tapImage(_ sender: Any) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "movieDetail") as! MovieDetailController
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    private func addChildController() {
        addChild(self.accountController)
        addChild(self.listTicketController)
        addChild(self.logoutController)
        
        view.addSubview(accountController.view)
        view.addSubview(listTicketController.view)
        view.addSubview(logoutController.view)

        accountController.view.frame = view.bounds
        listTicketController.view.frame = view.bounds
        logoutController.view.frame = view.bounds
        
        accountController.didMove(toParent: self)
        listTicketController.didMove(toParent: self)
        logoutController.didMove(toParent: self)
        
        accountController.view.isHidden = true
        listTicketController.view.isHidden = true
        logoutController.view.isHidden = true
    }
    
    func didSelectMenuItem(named: String) {
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            if named == "Tài Khoản" {
                self?.accountController.view.isHidden = false
                self?.listTicketController.view.isHidden = true
                self?.logoutController.view.isHidden = true
                let next = self?.storyboard?.instantiateViewController(withIdentifier: "account") as! AccountController
                self?.navigationController?.pushViewController(next, animated: true)
            } else if named == "Danh Sách Vé Đặt" {
                self?.accountController.view.isHidden = true
                self?.listTicketController.view.isHidden = false
                self?.logoutController.view.isHidden = true
                let next = self?.storyboard?.instantiateViewController(withIdentifier: "listTicket") as! ListTicketController
                self?.navigationController?.pushViewController(next, animated: true)
            }else if named == "Đăng Xuất"{
                self?.accountController.view.isHidden = true
                self?.listTicketController.view.isHidden = true
                self?.logoutController.view.isHidden = false
                let next = self?.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginController
                self?.navigationController?.pushViewController(next, animated: true)
            }
        })
    }
        
    @IBAction func tapMenu(_ sender: Any) {
        present(sideMenu!, animated: true)
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
        let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "slider", for: indexPath) as! MyCollectionView
        cell.myImage.image = UIImage(named: imgArr[indexPath.row])
        cell.layer.cornerRadius = 50.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
}


