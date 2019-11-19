//
//  RatioNode.swift
//  Texturan
//
//  Created by James Sraun on 14/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import AsyncDisplayKit

class RatioNode: ASDisplayNode {
    let testNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .green
        node.automaticallyManagesSubnodes = true
//        node.style.height = ASDimensionMake(200)
        node.style.width = ASDimensionMake(50)
        
        let innerCenterNode = ASDisplayNode()
        innerCenterNode.backgroundColor = .red
        node.layoutSpecBlock = { _, constrainedSize in
            return ASRatioLayoutSpec(ratio: 0.5, child: innerCenterNode)
        }
        
        return node
    }()

    override init() {
        super.init()
        backgroundColor = .init(white: 0.8, alpha: 1.0)
        automaticallyManagesSubnodes = true
        automaticallyRelayoutOnSafeAreaChanges = true
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec.vertical()
        stack.child = testNode
        return ASInsetLayoutSpec(insets: safeAreaInsets, child: stack)
    }
}
