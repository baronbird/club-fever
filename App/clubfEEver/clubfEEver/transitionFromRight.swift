//
//  transitionFromRight.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/30/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//

import UIKit

class transitionFromRight: UIStoryboardSegue {
        override func perform() {
            let src = self.source
            let dst = self.destination
            let transition: CATransition = CATransition()
            let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.duration = 0.3
            transition.timingFunction = timeFunc
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromBottom
            
            src.view.window?.layer.add(transition, forKey: nil)
            src.present(dst, animated: false, completion: nil)
        }
}
