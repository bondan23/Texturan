//
//  WrapperNode.swift
//  Texturan
//
//  Created by James Sraun on 13/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import AsyncDisplayKit

class WrapperNode: ASDisplayNode {
    let testNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .blue
        
        return node
    }()
    
    override init() {
        super.init()
        backgroundColor = .init(white: 0.8, alpha: 1.0)
        automaticallyManagesSubnodes = true
        automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let wrapperSpec = ASWrapperLayoutSpec(layoutElement: testNode)
        return ASInsetLayoutSpec(insets: safeAreaInsets, child: wrapperSpec)
    }
}
