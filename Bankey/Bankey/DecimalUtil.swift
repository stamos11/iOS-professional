//
//  DecimalUtil.swift
//  Bankey
//
//  Created by stamoulis nikolaos on 21/1/24.
//

import Foundation

extension Decimal {
    
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
