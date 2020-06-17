//
//  CompositionView.swift
//  Instagrid
//
//  Created by Rudy on 16/06/2020.
//  Copyright © 2020 ruzev. All rights reserved.
//

import UIKit

class CompositionView: UIView {
    
    enum StyleCompo {
        case style1, style2, style3
    }
    
    var styleCompo: StyleCompo = .style1 {
        didSet{
            setStyleCompo(styleCompo)
        }
    }
    
    public func setStyleCompo(_ styleCompo: StyleCompo) {
        switch styleCompo{
        case .style1:
            backgroundColor = #colorLiteral(red: 0.05878440291, green: 0.4433942437, blue: 0.636279285, alpha: 1)
        case .style2:
            backgroundColor = #colorLiteral(red: 0.05878440291, green: 0.4433942437, blue: 0.636279285, alpha: 1)
        case .style3:
            backgroundColor = #colorLiteral(red: 0.05878440291, green: 0.4433942437, blue: 0.636279285, alpha: 1)
        }
    }
    
}
