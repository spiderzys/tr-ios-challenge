//
//  JSONDecoder.swift
//  Movie
//
//  Created by Yangsheng Zou on 2021-01-08.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation


extension JSONDecoder {
    
    func decode<T:Decodable>(data: Data, success:(T) -> Void, failure: (Error) -> Void) {
        do {
            let output = try JSONDecoder().decode(T.self, from: data)
            success(output)
        } catch  {
            failure(error)
        }
    }
}
