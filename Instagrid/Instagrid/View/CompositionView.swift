//
//  CompositionView.swift
//  Instagrid
//
//  Created by Rudy on 16/06/2020.
//  Copyright © 2020 ruzev. All rights reserved.
//

import UIKit

class CompositionView: UIView {
    
    //Pic view outlet for disable if we want
    @IBOutlet weak var picView1: UIView!
    @IBOutlet weak var picView2: UIView!
    @IBOutlet weak var picView3: UIView!
    @IBOutlet weak var picView4: UIView!
    
    @IBOutlet weak var pic1: UIImageView!
    @IBOutlet weak var pic3: UIImageView!
    
    @IBOutlet weak var compositionView: CompositionView!
    
    enum StyleCompo {
        case style1, style2, style3
    }
    
    var styleCompo: StyleCompo = .style3 {
        didSet{
            setStyleCompo(styleCompo)
        }
    }
    
    public func setStyleCompo(_ styleCompo: StyleCompo) {
        switch styleCompo{
        case .style1:
            picView1.isHidden = false
            picView2.isHidden = true
            picView3.isHidden = false
            picView4.isHidden = false
            
            //picView1.widthAnchor.constraint(equalTo: picView3.widthAnchor, multiplier: 2, constant: -10).isActive = true
            //picView1.layoutIfNeeded()
            
        case .style2:
            picView1.isHidden = false
            picView2.isHidden = false
            picView3.isHidden = false
            picView4.isHidden = true
            //picView1.widthAnchor.constraint(equalTo: picView1.widthAnchor, multiplier: 2, constant: -10).isActive = true
        case .style3:
            picView1.isHidden = false
            picView2.isHidden = false
            picView3.isHidden = false
            picView4.isHidden = false
        }
    }
    
}
