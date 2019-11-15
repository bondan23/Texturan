//
//  LayoutNode.swift
//  Texturan
//
//  Created by James Sraun on 14/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import AsyncDisplayKit

class LayoutNode: ASDisplayNode {
    let testNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.style.flexGrow = 1
        node.backgroundColor = .blue
        
        return node
    }()
    
    let testNode2: ASDisplayNode = {
        let node = ASDisplayNode()
        node.style.flexGrow = 1
        node.backgroundColor = .red
        
        return node
    }()
    
    override init() {
        super.init()
        backgroundColor = .init(white: 0.8, alpha: 1)
        automaticallyManagesSubnodes = true
        automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let spacer = ASLayoutSpec()
        spacer.style.flexGrow = 1
        
        let stackLayout = ASStackLayoutSpec(direction: .vertical,
                                            spacing: 0,
                                            justifyContent: .spaceBetween,
                                            alignItems: .stretch,
                                            children: [testNode,testNode2])
        
        return ASInsetLayoutSpec(insets: safeAreaInsets, child: stackLayout)
    }
}
