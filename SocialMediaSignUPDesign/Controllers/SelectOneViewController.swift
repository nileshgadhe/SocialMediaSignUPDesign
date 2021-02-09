//
//  SelectOneViewController.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 24/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class SelectOneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneButton: UIButton!
    
    
    private var index = 100
    private var selectOneModelArray = [SelectOneModel]()
    
    private var tempArray = ["I'm Artist", "I'm Student", "I'm Actor", "I'm Photographer", "I'm Businessman", "I'm Actor", "I'm Model", "I'm Dancer", "I'm Fitness Trainer", "I'm Dancer", "I'm Writer", "I'm Musician", "I'm Engineer", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       setUpView()
       setDataToModelArray()
       setTable()
        
    }
    
    private func setUpView(){
       
        SetBorder().setButton(button: doneButton, cronerRadius: doneButton.frame.height/2)
    }
    
    private func setTable(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "SelectOneTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectOneTableViewCell")
        
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
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        //AddInterestViewController
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "AddInterestViewController") as? AddInterestViewController
        self.present(vc!, animated: true, completion: nil)
    }
    
}


extension SelectOneViewController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return selectOneModelArray.count
    }
    
}

extension SelectOneViewController{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectOneTableViewCell", for: indexPath) as! SelectOneTableViewCell
        
        let data = selectOneModelArray[indexPath.row]
        cell.lblName.text = data.name
        if index == indexPath.row{
            cell.containerView.backgroundColor = UIColor.lightGray
            cell.imgView.image = UIImage(named: "ic_cross_round")
        } else{
            cell.containerView.backgroundColor = UIColor.white
            cell.imgView.image = nil
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
