//
//  OverlayNode.swift
//  Texturan
//
//  Created by James Sraun on 14/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import AsyncDisplayKit


class OverlayNode: ASDisplayNode {
    
    let childNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .blue
        node.style.preferredSize = CGSize(width: 100, height: 100)
        
        return node
    }()
    
    let overlayNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(string: "Lorem Ipsum")
        node.backgroundColor = .none
        
        return node
    }()
    
    override init() {
        super.init()
        backgroundColor = .init(white: 0.8, alpha: 1)
        addSubnode(childNode)
        addSubnode(overlayNode)
        automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let overlaySpec = ASOverlayLayoutSpec(child: childNode, overlay: overlayNode)
        
        let centerSpec = ASCenterLayoutSpec(horizontalPosition: .center, verticalPosition: .center, sizingOption: .minimumSize, child: overlaySpec)
        
        return ASInsetLayoutSpec(insets: safeAreaInsets, child: centerSpec)
    }
}
