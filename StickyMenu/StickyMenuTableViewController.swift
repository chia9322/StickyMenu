//
//  StickyMenuTableViewController.swift
//  StickyMenu
//
//  Created by Chia on 2022/08/31.
//

import UIKit

class StickyMenuTableViewController: UITableViewController {
    
    var buttons: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
//        navigationItem.title = "Sticky Menu"
        configureHeaderView()
        selectButton(0)
    }
    
    // MARK: - Sticky Menu
    func configureHeaderView() {
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        // Create horizontal button stack
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        buttonStackView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        for i in 0...4 {
            let button = UIButton(type: .system)
            var config = UIButton.Configuration.filled()
            config.title = String(i+1)
            config.baseBackgroundColor = UIColor(named: "brown")
            button.configuration = config
            button.tag = i
            button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
            buttons.append(button)
        }
        for button in buttons {
            buttonStackView.addArrangedSubview(button)
        }
        
        // Create vertical stack
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fill
        verticalStackView.spacing = 10
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "headerImg")
        verticalStackView.addArrangedSubview(imageView)
        verticalStackView.addArrangedSubview(buttonStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Header view setting
        headerView.addSubview(verticalStackView)
        verticalStackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -5).isActive = true
        verticalStackView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 5).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5).isActive = true
        
        tableView.tableHeaderView = headerView
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        headerView.leadingAnchor.constraint(equalTo: tableView.frameLayoutGuide.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: tableView.frameLayoutGuide.trailingAnchor).isActive = true
        let topConstraint = headerView.topAnchor.constraint(equalTo: tableView.contentLayoutGuide.topAnchor)
        topConstraint.priority = UILayoutPriority(999)
        topConstraint.isActive = true
        headerView.bottomAnchor.constraint(greaterThanOrEqualTo: tableView.safeAreaLayoutGuide.topAnchor, constant: 54).isActive = true
    }
    
    @objc func buttonPressed(sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        
        let currentContentOffset = tableView.contentOffset
        tableView.scrollToRow(at: indexPath, at: .top, animated: false)
        let newContentOffset = tableView.contentOffset
        tableView.setContentOffset(currentContentOffset, animated: false)
        
        tableView.setContentOffset(CGPoint(x: 0, y: newContentOffset.y-54), animated: true)
        selectButton(sender.tag)
    }
    
    func selectButton(_ selectedRow: Int) {
        for button in buttons {
            button.configuration?.baseBackgroundColor = UIColor(named: "lightBrown")
            if button.tag == selectedRow {
                button.configuration?.baseBackgroundColor = UIColor(named: "brown")
            }
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.rowImageView.image = UIImage(named: "img\(indexPath.row + 1)")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }
    
}
