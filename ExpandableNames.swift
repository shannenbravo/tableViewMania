//
//  ExpandableNames.swift
//  tryingATableview
//
//  Created by Shannen Bravo-Brown on 3/28/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import Foundation

struct ExpandableNames {
    var isExpanded: Bool
    var names: [Conatct]
}

struct Conatct {
    let name: String
    var hasFavorited: Bool
}
