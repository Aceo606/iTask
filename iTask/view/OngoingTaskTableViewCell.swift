//
//  OngoingTaskTableViewCell.swift
//  iTask
//
//  Created by Assan Kabayev on 19.01.2023.
//

import UIKit

class OngoingTaskTableViewCell: UITableViewCell {
    
    var actionButtonDidTap: (() -> Void)?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    
    func configure(with task: Task){
        titleLabel.text = task.title
        deadlineLabel.text = task.deadline?.toRelativeString()
        
        if task.deadline?.isOverDue() == true{
            deadlineLabel.textColor = .red
            deadlineLabel.font = UIFont(name: "AvenirNext-Medium", size: 13)
            
        } else {
            deadlineLabel.textColor = .gray
            
        }
        
    }
    
    @IBAction func actionButtonTapped(_ sender: UIButton){
        actionButtonDidTap?()
    }
    
}
