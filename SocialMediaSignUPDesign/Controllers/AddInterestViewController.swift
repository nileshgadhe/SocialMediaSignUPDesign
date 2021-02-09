//
//  AddInterestViewController.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 24/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class AddInterestViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var txtFieldSearch: UITextField!
    
    @IBOutlet weak var selectedInterestCollectionView: UICollectionView!
    @IBOutlet weak var selectYourInterestCollectionView: UICollectionView!
    
    private var selectInterestModelArray = [SelectOneModel]()
    private var selectedInterestModerArray = [SelectOneModel]()
    
    private var tempArray = ["Movie", "Music", "Sport", "Food", "Fitness", "Vechicles", "Toys", "Shopping", "Business", "Travel", "Politics"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setDataToModelArray()
        setDelegate()
        setCollectionView()
        
        
    }
    
    private func setUpView(){
       
        SetBorder().setButton(button: nextButton, cronerRadius: nextButton.frame.height/2)
        
        searchContainerView.layer.cornerRadius = searchContainerView.frame.height/2
        searchContainerView.layer.borderWidth = 0.5
        searchContainerView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setDelegate(){
        
        txtFieldSearch.delegate = self
    }
    
    private func setDataToModelArray(){
        
        for name in tempArray{
            let selctOne = SelectOneModel(name: name, isSelectec: false)
            selectInterestModelArray.append(selctOne)
        }
        
    }
    
    
    private func setCollectionView(){
        
        self.selectedInterestCollectionView.register(UINib(nibName: "SelectedInterestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectedInterestCollectionViewCell")
        
        self.selectYourInterestCollectionView.register(UINib(nibName: "SelectInterestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectInterestCollectionViewCell")
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "SelectAgeGroupViewController") as? SelectAgeGroupViewController
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    
}

extension AddInterestViewController{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == selectedInterestCollectionView{
            return selectedInterestModerArray.count
        } else{
            return selectInterestModelArray.count
        }
     
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

extension AddInterestViewController{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == selectedInterestCollectionView{
            //SelectedInterestCollectionViewCell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedInterestCollectionViewCell", for: indexPath) as! SelectedInterestCollectionViewCell
            let data = selectedInterestModerArray[indexPath.row]
            cell.lblInterest.text = data.name!
            cell.containerView.backgroundColor = UIColor.lightGray
            
            return cell
            
        } else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectInterestCollectionViewCell", for: indexPath) as! SelectInterestCollectionViewCell
            let data = selectInterestModelArray[indexPath.row]
            cell.lblInterest.text = data.name!
            if data.isSelectec == true{
                cell.containerView.backgroundColor = UIColor.lightGray
                cell.isUserInteractionEnabled = false
            } else{
                cell.containerView.backgroundColor = UIColor.hexStringToUIColor(hex: "#F5F5F5")
                cell.isUserInteractionEnabled = true
            }
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == selectYourInterestCollectionView{
            let data = selectInterestModelArray[indexPath.row]
            data.isSelectec = true
            selectedInterestModerArray.append(data)
            self.selectYourInterestCollectionView.reloadData()
            self.selectedInterestCollectionView.reloadData()
        } else{
            let data = selectedInterestModerArray[indexPath.row]
            
            self.selectedInterestModerArray.remove(at: indexPath.row)
            data.isSelectec = false
            self.selectYourInterestCollectionView.reloadData()
            self.selectedInterestCollectionView.reloadData()
            
            /*
            let selectedInterest = data.name!
            
            for index in 0..<selectedInterestModerArray.count{
                let tempName = selectedInterestModerArray[index].name!
                if tempName == selectedInterest{
                    self.selectedInterestModerArray.remove(at: index)
                    data.isSelectec = false
                    self.selectYourInterestCollectionView.reloadData()
                    self.selectedInterestCollectionView.reloadData()
                }
            }
            */
            
        }
    }
    
}
