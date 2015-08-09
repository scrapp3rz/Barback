//
//  DescriptionTextView.swift
//  Barback
//
//  Created by Justin Duke on 11/28/14.
//  Copyright (c) 2014 Justin Duke. All rights reserved.
//

import Foundation
import UIKit

public class DescriptionTextView : UITextView {

    var markdownText: NSString? {
        didSet {
            let parser = NSAttributedStringMarkdownParser()
            parser.paragraphFont = font
            parser.italicFontName = UIFont.heavyFont()
            attributedText = parser.attributedStringFromMarkdownString(markdownText! as String)
            textAlignment = NSTextAlignment.Center
            textColor = Color.Light.toUIColor()
        }
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        styleLabel()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
    }

    func styleLabel() {
        font = UIFont(name: UIFont.primaryFont(), size: 15)
        textAlignment = NSTextAlignment.Center
        backgroundColor = Color.Background.toUIColor()
        tintColor = Color.Tint.toUIColor()
    }
}