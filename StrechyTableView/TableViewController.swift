//
//  TableViewController.swift
//  StrechyTableView
//
//  Created by Burak Donat on 19.05.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: -Properties
    @IBOutlet var tableView: UITableView!
    var headerView: UIView!
    var tableViewHeaderHeight:CGFloat = 400.0

    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        congigureUI()
        addStrechyHeader()
        updateHeaderView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateHeaderView()
    }
    
    //MARK: -Helpers
    func addStrechyHeader(){
        tableView.rowHeight = UITableView.automaticDimension
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: tableViewHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableViewHeaderHeight)
        
        //Creating a text in the middle of the image.
        let label = UILabel(frame: CGRect.zero)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "GillSans-Bold", size: 35)
        label.text = "Restaurants"
        headerView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
    }
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -tableViewHeaderHeight, width: tableView.bounds.width, height: tableViewHeaderHeight)
        if tableView.contentOffset.y < -tableViewHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
    func congigureUI() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
}
    
//MARK: -UITableView Data Source
extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = "Your content"
        cell.detailTextLabel?.text = "Content Details"
        return cell
    }
}



