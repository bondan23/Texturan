//
//  BackgroundNode.swift
//  Texturan
//
//  Created by James Sraun on 14/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import AsyncDisplayKit


class BackgroundNode: ASDisplayNode {
    
    let backgroundNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .blue
        
        return node
    }()
    
    let childNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(string: "Texturan")
        node.backgroundColor = .none
        
        return node
    }()
    
    override init() {
        super.init()
        backgroundColor = .init(white: 0.8, alpha: 1)
        addSubnode(backgroundNode)
        addSubnode(childNode)
        automaticallyRelayoutOnSafeAreaChanges = true
    }
}
