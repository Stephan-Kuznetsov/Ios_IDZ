//
//  BookClass.swift
//  IDZ_Project
//
//  Created by Ais Moll on 05.12.2020.
//  Copyright © 2020 Ais Moll. All rights reserved.
//

import Foundation
import UIKit

struct BookClass{
    
    var Quantity: Int;
    var Title: String
    var Author: String
    
    var Status: String {
        if (Quantity == 0) { return "Нет в наличии." }
        else { return ( "Есть в наличии: " + String(Quantity)) }
    }
    var Color: UIColor {
        if (Quantity == 0) { return .red }
        else if (Quantity < 5) {return .systemYellow }
        else { return .green }
    }
    
}
