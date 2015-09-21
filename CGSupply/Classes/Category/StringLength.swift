//
//  StringLength.swift
//  CGSupply
//
//  Created by liujun on 15/9/20.
//  Copyright © 2015年 liujun. All rights reserved.
//

import Foundation

extension String {
    
    public func length() -> Int {
        var index = 0;
        for _ in self.utf8 {
            index = index + 1
        }
        return index
    }
    
}