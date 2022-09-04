//
//  CustomTableViewCell.swift
//  StickyMenu
//
//  Created by Chia on 2022/08/31.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let rowImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        rowImageView.translatesAutoresizingMaskIntoConstraints = false
        rowImageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(rowImageView)
        rowImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        rowImageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        rowImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        rowImageView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }

}
