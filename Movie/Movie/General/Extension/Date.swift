//
//  Date.swift
//  Movie
//
//  Created by Yangsheng Zou on 2021-01-08.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation



extension Date {
    static func dateDescription(timeStamp: Double) -> String {
        // get the date string from the time stamp
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
        
    }
}
