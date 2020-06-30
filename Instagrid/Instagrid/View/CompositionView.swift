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
    
    // Display management according to the user's choice
    public func setStyleCompo(_ styleCompo: StyleCompo) {
        picView1.isHidden = false
        picView2.isHidden = styleCompo == .style1
        picView3.isHidden = false
        picView4.isHidden = styleCompo == .style2
    }
    
}
