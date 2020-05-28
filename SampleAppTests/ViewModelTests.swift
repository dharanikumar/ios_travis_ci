//
//  ViewModelTests.swift
//  SampleAppTests
//
//  Created by DharaniKumar on 28/05/20.
//  Copyright © 2020 DharaniKumar. All rights reserved.
//

import XCTest
@testable import SampleApp

class ViewModelTests: XCTestCase {
    var viewModel: ViewModel!
    var mockViewModelProtocol: MockViewModelProtocol!
    override func setUp() {
        mockViewModelProtocol = MockViewModelProtocol()
        viewModel = ViewModel(tableVCDelagate: mockViewModelProtocol)
    }

    func testNumberOfRows() throws {
        XCTAssertEqual(10, viewModel.numberOfRows)
    }

    func testRowHeight() throws {
        XCTAssertEqual(100, viewModel.rowHeight)
    }

    func testCellModelForGivenIndex() throws {
        let index = IndexPath(row: 5, section: 0)
        let data = StringData(name: "name")
        viewModel.dataSource = [data]
        XCTAssertEqual("", viewModel.cellModel(for: index))
    }
}
class MockViewModelProtocol : ViewModelProtocol {
    func didLoadResults() {
    }
}
