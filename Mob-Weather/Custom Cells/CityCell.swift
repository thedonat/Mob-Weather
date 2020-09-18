//
//  CityCellTableViewCell.swift
//  Mob-Weather
//
//  Created by Burak Donat on 11.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setSelectedCell(_ selected: Bool) {
        if selected {
            self.backgroundColor = .purple
         } else {
            self.backgroundColor = .clear
        }
    }
}
