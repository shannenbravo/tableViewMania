//
//  CellContact.swift
//  tryingATableview
//
//  Created by Shannen Bravo-Brown on 3/29/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell{
    var link: ViewController?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let starButton = UIButton(type: .system)
        //set image
        starButton.setImage(#imageLiteral(resourceName: "fav_star"), for: .normal)
        //set height snd width
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        starButton.tintColor = .red
        //need to make a target for the button
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = starButton
    }
    
    @objc private func handleMarkAsFavorite(){
//        print("marking as fav")
        link?.someMethodIWantToCall(cell: self)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

