//
//  RootNode.swift
//  Texturan
//
//  Created by James Sraun on 12/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import UIKit
import AsyncDisplayKit

enum CenteringOption: String {
    case XY
    case X
    case Y
    case N
    
    var value: ASCenterLayoutSpecCenteringOptions {
        switch self {
        case .XY:
            return .XY
        case .X:
            return .X
        case .Y:
            return .Y
        case .N:
            return .init()
        }
    }
}

enum SizingOption: String {
    case minimumXY
    case minimumX
    case minimumY
    case Default
    
    var value: ASCenterLayoutSpecSizingOptions {
        switch self {
        case .minimumXY:
            return .minimumXY
        case .minimumX:
            return .minimumX
        case .minimumY:
            return .minimumY
        case .Default:
            return .init()
        }
    }
}

class CenterNode: ASDisplayNode {
    let outerCenterNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .blue
        node.style.minSize = CGSize(width: 150, height: 150)
        node.style.maxSize = CGSize(width: 300, height: 300)

        return node
    }()
    
    let innerCenterNode: ASTextNode = {
        let node = ASTextNode()
        node.backgroundColor = .orange
        node.attributedText = NSAttributedString(string: "Texturan",
                                                 attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        
        return node
    }()
    
    let xyButton: ASButtonNode = {
        let node = ASButtonNode()
        node.backgroundColor = .init(white: 0.8, alpha: 1)
        node.style.preferredSize = CGSize(width: 30, height: 30)
        node.cornerRadius = 15
        node.setAttributedTitle(NSAttributedString(string: "XY"), for: .normal)
        node.isSelected = true
        
        return node
    }()
    
    let xButton: ASButtonNode = {
        let node = ASButtonNode()
        node.backgroundColor = .init(white: 0.95, alpha: 1)
        node.style.preferredSize = CGSize(width: 30, height: 30)
        node.cornerRadius = 15
        node.setAttributedTitle(NSAttributedString(string: "X"), for: .normal)
        
        return node
    }()
    
    let yButton: ASButtonNode = {
        let node = ASButtonNode()
        node.backgroundColor = .init(white: 0.95, alpha: 1)
        node.style.preferredSize = CGSize(width: 30, height: 30)
        node.cornerRadius = 15
        node.setAttributedTitle(NSAttributedString(string: "Y"), for: .normal)
        
        return node
    }()
    
    let defaultCenteringButton: ASButtonNode = {
        let node = ASButtonNode()
        node.backgroundColor = .init(white: 0.95, alpha: 1)
        node.style.preferredSize = CGSize(width: 30, height: 30)
        node.cornerRadius = 15
        node.setAttributedTitle(NSAttributedString(string: "N"), for: .normal)
        
        return node
    }()
    
    
    let minxyButton: ASButtonNode = {
        let node = ASButtonNode()
        node.backgroundColor = .init(white: 0.8, alpha: 1)
        node.cornerRadius = 6
        node.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        node.setAttributedTitle(NSAttributedString(string: "minimumXY"), for: .normal)
        node.isSelected = true
        
        return node
    }()
    
    let minxButton: ASButtonNode = {
        let node = ASButtonNode()
        node.backgroundColor = .init(white: 0.95, alpha: 1)
        node.cornerRadius = 6
        node.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        node.setAttributedTitle(NSAttributedString(string: "minimumX"), for: .normal)
        
        return node
    }()
    
    let minyButton: ASButtonNode = {
        let node = ASButtonNode()
        node.backgroundColor = .init(white: 0.95, alpha: 1)
        node.cornerRadius = 6
        node.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        node.setAttributedTitle(NSAttributedString(string: "minimumY"), for: .normal)
        
        return node
    }()
    
    let defaultSizingButton: ASButtonNode = {
        let node = ASButtonNode()
        node.backgroundColor = .init(white: 0.95, alpha: 1)
        node.cornerRadius = 6
        node.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        node.setAttributedTitle(NSAttributedString(string: "Default"), for: .normal)
        
        return node
    }()
    
    let header1 = ASTextNode()
    let header2 = ASTextNode()
    let title1 = ASTextNode()
    let title2 = ASTextNode()
    
    override init() {
        super.init()
        backgroundColor = .init(white: 1, alpha: 1.0)
        automaticallyManagesSubnodes = true
        automaticallyRelayoutOnSafeAreaChanges = true
        
        outerCenterNode.layoutSpecBlock = { [innerCenterNode] _,_ in
            return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: innerCenterNode)
        }
        
        header1.attributedText = NSAttributedString(string: "Minimum Size (width: 150, height: 150)")
        header2.attributedText = NSAttributedString(string: "Maximum Size (width: 300, height: 300)")
        title1.attributedText = NSAttributedString(string: "Centering Options:")
        title2.attributedText = NSAttributedString(string: "Sizing Options:")
    }
    
    override func didLoad() {
        super.didLoad()
        setTargets()
    }
    
    func setTargets() {
        xyButton.addTarget(self, action: #selector(buttonPressed), forControlEvents: .touchUpInside)
        xButton.addTarget(self, action: #selector(buttonPressed), forControlEvents: .touchUpInside)
        yButton.addTarget(self, action: #selector(buttonPressed), forControlEvents: .touchUpInside)
        defaultCenteringButton.addTarget(self, action: #selector(buttonPressed), forControlEvents: .touchUpInside)
        
        
        minxyButton.addTarget(self, action: #selector(buttonPressed2), forControlEvents: .touchUpInside)
        minxButton.addTarget(self, action: #selector(buttonPressed2), forControlEvents: .touchUpInside)
        minyButton.addTarget(self, action: #selector(buttonPressed2), forControlEvents: .touchUpInside)
        defaultSizingButton.addTarget(self, action: #selector(buttonPressed2), forControlEvents: .touchUpInside)
    }
    
    @objc func buttonPressed(sender: ASButtonNode) {
        let buttons = [xyButton, xButton, yButton, defaultCenteringButton]
        
        buttons.forEach { button in
            if button == sender {
                button.backgroundColor = .init(white: 0.8, alpha: 1)
                button.isSelected = true
                relayoutOuterNode()
            } else {
                button.backgroundColor = .init(white: 0.95, alpha: 1)
                button.isSelected = false
            }
        }
    }
    
    @objc func buttonPressed2(sender: ASButtonNode) {
        let buttons = [minxyButton, minxButton, minyButton, defaultSizingButton]
        
        buttons.forEach { button in
            if button == sender {
                button.backgroundColor = .init(white: 0.8, alpha: 1)
                button.isSelected = true
                relayoutOuterNode()
            } else {
                button.backgroundColor = .init(white: 0.95, alpha: 1)
                button.isSelected = false
            }
        }
    }
    
    func relayoutOuterNode() {
        
        let buttons1 = [xyButton, xButton, yButton, defaultCenteringButton]
        let buttons2 = [minxyButton, minxButton, minyButton, defaultSizingButton]
        
        let button1 = buttons1.first { $0.isSelected == true }!
        let title1 = button1.titleNode.attributedText!.string

        let button2 = buttons2.first { $0.isSelected == true }!
        let title2 = button2.titleNode.attributedText!.string

        outerCenterNode.layoutSpecBlock = { [innerCenterNode] _,_ in
            return ASCenterLayoutSpec(centeringOptions: CenteringOption(rawValue: title1)!.value,
                                      sizingOptions: SizingOption(rawValue: title2)!.value,
                                      child: innerCenterNode)
        }

        outerCenterNode.transitionLayout(withAnimation: true,
                                         shouldMeasureAsync: false,
                                         measurementCompletion: nil)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let centerSpec = ASCenterLayoutSpec(horizontalPosition: .center, verticalPosition: .center, sizingOption: .minimumSize, child: outerCenterNode)
        
        let bottomRelativeSpec = ASRelativeLayoutSpec(horizontalPosition: .center,
                                                verticalPosition: .end,
                                                sizingOption: .minimumWidth,
                                                child: createBottomSpec())
        
        let topRelativeSpec = ASRelativeLayoutSpec(horizontalPosition: .center,
        verticalPosition: .start,
        sizingOption: .minimumWidth,
        child: createTopSpec())
        
        let wrapperSpec = ASWrapperLayoutSpec(layoutElements: [centerSpec,topRelativeSpec, bottomRelativeSpec])
        
        return ASInsetLayoutSpec(insets: safeAreaInsets, child: wrapperSpec)
    }
    
    func createTopSpec() -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .vertical,
                                 spacing: 8,
                                 justifyContent: .start,
                                 alignItems: .start,
                                 children: [header1, header2])
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0), child: stack)
    }
        
    func createBottomSpec() -> ASLayoutSpec {
        
        
        let stackSpec1 = ASStackLayoutSpec.horizontal()
        stackSpec1.spacing = 8
        stackSpec1.children = [xyButton, xButton,yButton, defaultCenteringButton]
        
        let stackSpec2 = ASStackLayoutSpec.horizontal()
        stackSpec2.spacing = 8
        stackSpec2.children = [minxyButton,minxButton,minyButton,defaultSizingButton]
        
        return ASStackLayoutSpec(direction: .vertical,
                                 spacing: 8,
                                 justifyContent: .start,
                                 alignItems: .start,
                                 children: [title1, stackSpec1, title2, stackSpec2])
    }
}
