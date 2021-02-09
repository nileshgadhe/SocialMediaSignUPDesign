//
//  SelectAgeGroupViewController.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 24/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class SelectAgeGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    
    private var index = 100
    private var selectOneModelArray = [SelectOneModel]()
    
    private var tempArray = ["12 and Below", "13 - 18", "19 - 21", "22 - 30", "31 - 45", "46 - 70", "70 and Above", "Business"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
        setDataToModelArray()
        setTable()
    }
    
    private func setUpView(){
       
        SetBorder().setButton(button: nextButton, cronerRadius: nextButton.frame.height/2)
    }
    
    private func setTable(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "SelectAgeGroupTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectAgeGroupTableViewCell")
        
    }
    
    private func setDataToModelArray(){
        
        for name in tempArray{
            let selctOne = SelectOneModel(name: name, isSelectec: false)
            selectOneModelArray.append(selctOne)
        }
        
    }
    

    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        let appdelegate = (UIApplication.shared.delegate as! AppDelegate)
        appdelegate.setHomeViewController()
    }
    

}


extension SelectAgeGroupViewController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return selectOneModelArray.count
    }
    
}

extension SelectAgeGroupViewController{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectAgeGroupTableViewCell", for: indexPath) as! SelectAgeGroupTableViewCell
        
        let data = selectOneModelArray[indexPath.row]
        cell.lblGroup.text = data.name
        if index == indexPath.row{
            cell.imgView.image = UIImage(named: "ic_blackTickRound")
            cell.lblGroup.textColor = UIColor.black
        } else{
            cell.imgView.image = UIImage(named: "")
            cell.lblGroup.textColor = UIColor.darkGray
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let selectDate = self.selectOneModelArray[indexPath.row]
        //selectDate.isSelectec = true
        
        self.index = indexPath.row
        tableView.reloadData()
        
    }
    
    
}
