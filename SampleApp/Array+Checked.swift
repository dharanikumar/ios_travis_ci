//
//  Array+Checked.swift
//  SampleApp
//
//  Created by DharaniKumar on 28/05/20.
//  Copyright © 2020 DharaniKumar. All rights reserved.
//

import Foundation

extension Array {
    public subscript(checked index: Int) -> Element? {
        guard index >= 0 else{
            return nil
        }
        return index < count ? self[index] : nil
    }
}
