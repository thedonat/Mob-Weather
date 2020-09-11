//
//  Extensions.swift
//  Mob-Weather
//
//  Created by Burak Donat on 11.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let purplyBlue = UIColor.rgb(red: 117, green: 3, blue: 253)
    static let mariGold = UIColor.rgb(red: 253, green: 187, blue: 3)
    static let blueGrey = UIColor.rgb(red: 137, green: 143, blue: 160)
    static let veryLightPink = UIColor.rgb(red: 225, green: 225, blue: 225)
    static let veryLightBlue = UIColor.rgb(red: 226, green: 232, blue: 237)
    static let slate = UIColor.rgb(red: 76, green: 82, blue: 100)
    static let whiteTwo = UIColor.rgb(red: 238, green: 238, blue: 238)
    static let paleGrey = UIColor.rgb(red: 247, green: 247, blue: 250)
}
