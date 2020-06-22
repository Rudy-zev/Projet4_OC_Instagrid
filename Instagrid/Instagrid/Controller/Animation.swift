//
//  Animation.swift
//  Instagrid
//
//  Created by Rudy on 19/06/2020.
//  Copyright © 2020 ruzev. All rights reserved.
//

import Foundation

class Animation {
    var dampingRatio: Float = 0.5
    var initialVelocity: Float = 0.5
    var duration: Float = 0.5

    static let shared = Animation()
    private init() {}
}
