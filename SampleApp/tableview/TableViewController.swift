//
//  ViewController.swift
//  SampleApp
//
//  Created by DharaniKumar on 28/05/20.
//  Copyright © 2020 DharaniKumar. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController {
    private var viewModel: ViewModel!
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel(tableVCDelagate: self)
        setupTableView()
    }

    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(CustomCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.rowHeight
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = viewModel.cellModel(for: indexPath)

        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CustomCell
        cell.backgroundColor = UIColor.white
        return cell
    }
}

extension TableViewController: ViewModelProtocol {
    func didLoadResults() {
        DispatchQueue.main.sync {
            self.reload()
        }
    }

    func reload() {
        tableview.reloadData()
    }
}
