//
//  SegmentedControl.swift
//  Test
//
//  Created by Donald Nguyen on 9/20/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit

@IBDesignable class SegmentedControl: UIControl {
    private var labels = [UILabel] ()
    var thumbView = UIView()
    
    var items = ["Item 1", "Item 2", "Item 3"] {
        didSet {
            setupLabels ()
        }
    }
    
    var selectedIndex: Int = 0 {
        didSet {
            displayNewSelectedIndex()
        }
    }
    
    func displayNewSelectedIndex() {
        var label = labels[selectedIndex]
        self.thumbView.frame = label.frame
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       // fatalError("init(coder:) has not been implemented")
       setupView()
    } 
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var selectFrame = self.bounds
        let newWidth = selectFrame.width / CGFloat(items.count)
        selectFrame.size.width = newWidth
        
        thumbView.frame = selectFrame
        thumbView.backgroundColor = UIColor.white
        thumbView.layer.cornerRadius = thumbView.frame.height/2 //rounded edge
        
        let labelHeight = self.bounds.height
        let labelWidth = self.bounds.width / CGFloat(labels.count)
        
        
        
        for index in 0...labels.count - 1 {
            var label = labels[index]
            
            let xPosition = CGFloat(index) * labelWidth
            label.frame = CGRect(x: xPosition, y: 0, width: labelWidth, height: labelHeight)
            
        }
        
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        var calcIndex : Int?
        
        for(index, item) in labels.enumerated() {
            if item.frame.contains(location) {
                calcIndex = index
            }
        }
        
        if calcIndex != nil {
            selectedIndex  = calcIndex!
            sendActions(for: .valueChanged)
        }
        
        return false
    }
    
    func setupView() {
        layer.cornerRadius = frame.height / 2
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        
        backgroundColor = UIColor.clear
        
        setupLabels()
        insertSubview(thumbView, at: 0)
        
    }
    
    
    
    func setupLabels() {
        for label in labels {
            label.removeFromSuperview()
        }
        
        labels.removeAll(keepingCapacity:  true)
        
        for index in 1...items.count {
            let label = UILabel(frame: CGRect.zero)
            label.text = items[index - 1]
            label.textAlignment = .center
            self.addSubview(label)
            
            labels.append(label)
        }
    }
    
 
}
