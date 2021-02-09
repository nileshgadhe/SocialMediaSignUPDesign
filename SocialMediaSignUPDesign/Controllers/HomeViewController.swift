//
//  HomeViewController.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 23/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, UITabBarDelegate, UITabBarControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var plusTab: UITabBarItem!
    @IBOutlet weak var homeTab: UITabBarItem!
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var castButton: UIButton!
    @IBOutlet weak var followingButton: UIButton!
    
    
    
    @IBOutlet weak var studioButton: UIButton!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var isugestButton: UIButton!
    @IBOutlet weak var djiButton: UIButton!
    @IBOutlet weak var photographButton: UIButton!
    
    @IBOutlet weak var photoGalleryCollectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    private var tempArray = ["#DronePhotograph", "#Photo", "#Drone", "#HD Photo", "#Portrait"]
    
    /* Animation variable
    var isDialerOpen = false
    var allImages = ["ic_eye_open","ic_clap","ic_lamp","ic_greeting","ic_eye_off","ic_eye_open"]
    var cellLabel = ["Menu","Menu","Menu","Menu","Menu","Menu"
    let M_PI = 3.14
    let M_PI_2 = 1.57079632679489661923132169163975144
    let M_PI_4 =  0.785398163397448309615660845819875721
    var semiCircleLayer   = CAShapeLayer()
    var semiCircleLayerInner   = CAShapeLayer()
    let cellHeight: CGFloat = 70
    var collectionView: UICollectionView!
    var imgViewInner : UIImageView!
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        setUpView()
        setDelegate()
        setCollectionView()
        setTableView()
        //StoryCollectionViewCell
    }
    
    func setUpView(){
        
        tabBar.selectedItem = homeTab
        
        imageContainerView.layer.cornerRadius = 15
        
        imgView.layer.cornerRadius = 15
        imgView.layer.masksToBounds = false
        imgView.clipsToBounds = true
        
        SetBorder().setButtonWithoutBorder(button: studioButton, cronerRadius: studioButton.frame.height/2)
        SetBorder().setButtonWithoutBorder(button: castButton, cronerRadius: castButton.frame.height/2)
        SetBorder().setButtonWithoutBorder(button: followingButton, cronerRadius: followingButton.frame.height/2)
        
        SetBorder().setButtonWithoutBorder(button: isugestButton, cronerRadius: isugestButton.frame.height/2)
        SetBorder().setButtonWithoutBorder(button: djiButton, cronerRadius: djiButton.frame.height/2)
        SetBorder().setButtonWithoutBorder(button: photographButton, cronerRadius: photographButton.frame.height/2)
    }
    
    func setDelegate(){
        tabBar.delegate = self
    }
    
    func setTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "InterestHomeTableViewCell", bundle: nil), forCellReuseIdentifier: "InterestHomeTableViewCell")
        
    }
    
    
    func setCollectionView(){
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let widthValue = ((UIScreen.main.bounds.width - 60) / 3)
        let heightValue = 130
        layout.itemSize = CGSize(width: widthValue, height: CGFloat(heightValue))
        photoGalleryCollectionView.setCollectionViewLayout(layout, animated: true)
        
        self.photoGalleryCollectionView.register(UINib(nibName: "PhotoGalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoGalleryCollectionViewCell")
        self.storyCollectionView.register(UINib(nibName: "StoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoryCollectionViewCell")
    
    }
    
    /*
    func displayOnUIMenus(){
        
        //Circle Points
//        let center = CGPoint (x: -15, y: UIScreen.main.bounds.height/2)
//        let circleRadius =  UIScreen.main.bounds.width/2 + 55
//        let circlePath = UIBezierPath(arcCenter: center, radius: CGFloat(circleRadius), startAngle: CGFloat(M_PI_2), endAngle: .pi*3/2, clockwise: false)
        
        
        //Circle Points
        let center = CGPoint (x: UIScreen.main.bounds.width/2 + 35, y: UIScreen.main.bounds.height - 60)
        let circleRadius = 50
        let circlePath = UIBezierPath(arcCenter: center, radius: CGFloat(circleRadius), startAngle: CGFloat(M_PI/2), endAngle: CGFloat((M_PI/2 + 2.0*M_PI)), clockwise: true)
        
        print("\(3.14*3/2)")
        
        
        semiCircleLayer.path = circlePath.cgPath
        semiCircleLayer.strokeColor = UIColor.white.cgColor
        semiCircleLayer.fillColor = UIColor.clear.cgColor
        semiCircleLayer.lineWidth = 40
        semiCircleLayer.strokeStart = 0
        semiCircleLayer.strokeEnd  = 1
        self.view.layer.addSublayer(semiCircleLayer)
        
        
        //Inner circle
        //let centerInner = CGPoint (x: -15, y: UIScreen.main.bounds.height/2)
        //let circleRadiusInner = UIScreen.main.bounds.width/2+20
        
        /*
        let centerInner = CGPoint (x: 250, y: UIScreen.main.bounds.height - 200)
        let circleRadiusInner = 80
        
        let circlePathInner = UIBezierPath(arcCenter: center, radius: CGFloat(circleRadiusInner), startAngle: CGFloat(M_PI_2), endAngle: .pi*3/2, clockwise: false)
        
        
        semiCircleLayerInner.path = circlePathInner.cgPath
        semiCircleLayerInner.strokeColor = UIColor.white.cgColor
        semiCircleLayerInner.fillColor = UIColor.clear.cgColor
        semiCircleLayerInner.lineWidth = 1
        semiCircleLayerInner.strokeStart = 0
        semiCircleLayerInner.strokeEnd  = 1
        self.view.layer.addSublayer(semiCircleLayerInner)
        */
        
        /*
        let imageView = UIView(frame: CGRect(x: -(UIScreen.main.bounds.width/2)-15, y: (UIScreen.main.bounds.height/2-UIScreen.main.bounds.width/2)-12, width: UIScreen.main.bounds.width+12, height: UIScreen.main.bounds.width+24))
        imageView.backgroundColor = UIColor.clear
        
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        self.view.addSubview(imageView)
        
        let centerPoint = imageView.bounds
        
        
        imgViewInner = UIImageView(frame: CGRect(x: -(UIScreen.main.bounds.width/2)-15, y: (UIScreen.main.bounds.height/2-UIScreen.main.bounds.width/2)-12, width: UIScreen.main.bounds.width+12, height: UIScreen.main.bounds.width+24))
        imgViewInner.image = UIImage(named: "cr_rounded_background")
        imgViewInner.layer.cornerRadius = imgViewInner.frame.height/2
        imgViewInner.layer.borderColor = UIColor.white.cgColor
        self.imgViewInner.layer.masksToBounds = false
        self.imgViewInner.clipsToBounds = true
        self.imgViewInner.contentMode = .scaleAspectFill
        self.view.addSubview(imgViewInner)
        */
        
        /*
        let logoImg = UIImageView(frame: CGRect(x: -40, y: UIScreen.main.bounds.height/2-40, width: 80, height: 80))
        logoImg.image = UIImage(named: "logo")
        logoImg.contentMode = .scaleAspectFit
        self.view.addSubview(logoImg)
        */
        
        //var circularLayout = CPCollectionViewWheelLayout(radius: UIScreen.main.bounds.width/2 + 60, cellSize: CGSize(width: 160, height: 66), angular: 27, fadeAway: false, layoutType: CPWheelLayoutLeftCenter)
        //collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: circularLayout!)
        
        
        var circularLayout = CPCollectionViewWheelLayout(radius:40, cellSize: CGSize(width: 40, height: 40), angular: 90, fadeAway: false, layoutType: CPWheelLayoutBottomCenter)
        print(UIScreen.main.bounds.width/2 + 60)
        collectionView = UICollectionView(frame: CGRect(x: UIScreen.main.bounds.width/2 - 60, y: UIScreen.main.bounds.height - 250, width: 200, height: 200), collectionViewLayout: circularLayout!)
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuCollectionViewCell")
        self.view.addSubview(collectionView)
        self.collectionView.reloadData()
        self.collectionView.isHidden = true
        self.semiCircleLayer.isHidden = true
    
    }
    
    
    //collection view delegate and datasource methods
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return allImages.count
        }
        
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
            cell.layer.shouldRasterize = true
            cell.layer.rasterizationScale = UIScreen.main.scale
            
            let totalRows = allImages.count
            if indexPath.row == 0 || indexPath.row == totalRows-1{
                cell.imageView.isHidden = true
                cell.lblTitle.text = ""
                cell.bgBtn.isHidden = true
            }else{
                
                //cell.lblTitle.attributedText = menuArray[indexPath.row].MenuName.convertHtmlToAttributedStringWithCSS(font: UIFont(name: "OpenSans-SemiBold", size: 15), csscolor: "white", lineheight: 5, csstextalign: "left")
                
                cell.lblTitle.text = cellLabel[indexPath.row]
                
                cell.imageView.isHidden = false
                cell.bgBtn.isHidden = false

                DispatchQueue.global(qos: .background).async { // load data in back ground mode so that main thread can be safed.
                  
                    DispatchQueue.main.async(execute: {
                        //cell.imageView.sd_setImage(with: URL(string: self.menuArray[indexPath.row].MenuIcon), placeholderImage: UIImage(named: ""))
                        cell.imageView.image = UIImage(named: self.allImages[indexPath.row])
                    })
                 }
               
                
         
            }
            
            /*
            var count = couponsCountArray.count
    //        print("this is the coupons array:\(count)")
            if menuArray[indexPath.row].MenuType == "coupons"{
                if count == 0{
                    cell.lblCount.isHidden = true
                   
                }else{
                    cell.lblCount.isHidden = false
                    cell.lblCount.text = "\(count)"
                }
                
            }else{
                cell.lblCount.isHidden = true
            }
            
            */
            return cell
        }
    
    
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
    
        }
       */
    
    
    
    

    @IBAction func likeButtonTapped(_ sender: Any) {
    }
    
}


extension HomeViewController{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == storyCollectionView{
            return 10
        } else{
            return 9
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return tempArray.count
    }
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item == plusTab{
             
        }
        
    }
    
}

extension HomeViewController{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == storyCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
            return cell
        } else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoGalleryCollectionViewCell", for: indexPath) as! PhotoGalleryCollectionViewCell
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InterestHomeTableViewCell", for: indexPath) as! InterestHomeTableViewCell
        
        cell.lblName.text = tempArray[indexPath.row]
        
        return cell
    }
    
    
}

extension HomeViewController{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == storyCollectionView{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewStoryViewController") as! ViewStoryViewController
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
}
