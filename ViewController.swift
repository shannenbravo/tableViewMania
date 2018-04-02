//
//  ViewController.swift
//  tryingATableview
//
//  Created by Shannen Bravo-Brown on 3/7/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit
//make the class == to UItableview
class ViewController: UITableViewController {
    //set cell id
    let cellId = "cellId"
    //for the link
    func someMethodIWantToCall(cell: UITableViewCell){
        guard let indexPathTapped = tableView.indexPath(for: cell) else{return}
        //print(indexPathTapped)
        let contact = twoDementionalArray[indexPathTapped.section].names[indexPathTapped.row]
        let hasFavorited = contact.hasFavorited
        twoDementionalArray[indexPathTapped.section].names[indexPathTapped.row].hasFavorited = !hasFavorited
        tableView.reloadRows(at: [indexPathTapped], with: .fade)
        print(contact)
    }
    
    //hold names in 2d arrary
    var twoDementionalArray = [
//        ExpandableNames(isExpanded: true, names: ["shannen","bubby","rich", "jack","luke"]),
//        ExpandableNames(isExpanded: true, names: ["Toni", "troy", "bri",]),
        ExpandableNames(isExpanded: true, names: [Conatct(name:"Mike", hasFavorited: false), Conatct(name: "Pauline", hasFavorited: false), Conatct(name: "Jonny", hasFavorited: false)])
    ]
    var showIndexPath = false;
    
    @objc func handleReload()
    {
       
        var indexPathToReload = [IndexPath]()
        //get all the items in the first section
        
        for section in twoDementionalArray.indices{
            for row in twoDementionalArray[section].names.indices{
                let indexpath = IndexPath(row: row, section: section)
                indexPathToReload.append(indexpath)
            }
        }
        showIndexPath = !showIndexPath
        let animationType = showIndexPath ? UITableViewRowAnimation.right : .left
        tableView.reloadRows(at: indexPathToReload, with: animationType)
        
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the nav title
        navigationItem.title = "Contacts"
        //nav right button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(handleReload))
        //make thr font large
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ContactCell.self, forCellReuseIdentifier: cellId)
    
    }
    //header of the section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.backgroundColor = .yellow
        closeButton.setTitleColor(.black, for: .normal)
        closeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        closeButton.addTarget(self, action: #selector(handleOpenClose), for: .touchUpInside)
        closeButton.tag = section
        return closeButton
        
    }
    
    @objc func handleOpenClose(closebutton: UIButton){
        let section = closebutton.tag
        var indexPaths = [IndexPath]()
        for row in twoDementionalArray[section].names.indices{
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        let isExpanded = twoDementionalArray[section].isExpanded
        twoDementionalArray[section].isExpanded = !isExpanded
        //insert rows when expanded
        closebutton.setTitle(isExpanded ? "Open" : "Close", for: .normal)
        if isExpanded{
            tableView.deleteRows(at: indexPaths, with: .fade)
            
        }else{
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
        
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 34
    }
    //number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDementionalArray.count //retuen the number of section which we want to be the size of the array
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !twoDementionalArray[section].isExpanded{
            return 0
        }
        
        return twoDementionalArray[section].names.count //retun the rows which we want to be the the # of each item in the array in the 2d array

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContactCell
        cell.link = self
        let contact = twoDementionalArray[indexPath.section].names[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.accessoryView?.tintColor = contact.hasFavorited ? UIColor.red : .lightGray
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

