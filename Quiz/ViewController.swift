//
//  ViewController.swift
//  Quiz
//
//  Created by Ririko Nagaishi on 2021/02/13.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let style = NSMutableParagraphStyle
        style.lineSpacing = 40
        let attributes = [NSParagraphStyleAttributeName : style]
               textView.attributedText = NSAttributedString(string: textView.text,
                                              attributes: attributes)
        
    }


}

