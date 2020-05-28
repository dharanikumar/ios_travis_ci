//
//  ViewModel.swift
//  SampleApp
//
//  Created by DharaniKumar on 28/05/20.
//  Copyright © 2020 DharaniKumar. All rights reserved.
//

import Foundation
import UIKit

struct StringData{
    let name: String
}

public protocol ViewModelProtocol: AnyObject {
    func didLoadResults()
}
class ViewModel {
    var dataSource:[StringData]?
    weak var tableVCDelegate: ViewModelProtocol?
    var previousQuery: String = ""
    
    init(tableVCDelagate: ViewModelProtocol) {
        self.tableVCDelegate = tableVCDelagate
    }
    
    var numberOfRows: Int {
        return dataSource?.count ?? 0
    }

    var rowHeight: CGFloat {
        return 100.0
    }

    func cellModel(for index: IndexPath) -> String {
        let term  = dataSource?[index.row].name ?? ""

//      Fix:
//      let term  = dataSource?[checked: index.row]?.name ?? ""
        return term
    }

    //Schedules the request when user types
    func needData(query: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(loadDataForResults), object: previousQuery)
        previousQuery = query
    }

    //Method to fetch data
    //Trigerred when user types
    @objc
    func loadDataForResults() {
//        logicController.fetchData() { [weak self] results in
//            dataSource = results
//            self?.tableVCDelegate?.didLoadResults()
//        }
    }
}
