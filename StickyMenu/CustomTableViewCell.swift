//
//  CustomTableViewCell.swift
//  StickyMenu
//
//  Created by Chia on 2022/08/31.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let rowImageView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        rowImageView.translatesAutoresizingMaskIntoConstraints = false
        rowImageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(rowImageView)
        rowImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        rowImageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        rowImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        rowImageView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }

}
