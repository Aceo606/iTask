//
//  DoneTaskTableViewCell.swift
//  iTask
//
//  Created by Assan Kabayev on 19.01.2023.
//

import UIKit

class DoneTaskTableViewCell: UITableViewCell {
    
    var actionButtonDidTap: (() -> Void)?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with task: Task){
        titleLabel.text = task.title
    }
    
    @IBAction func actionButtonTapped(_ sender: UIButton){
        actionButtonDidTap?()
        
    }
    
}
