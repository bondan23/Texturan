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
        
        return node
    }()

    override init() {
        super.init()
        backgroundColor = .init(white: 0.8, alpha: 1.0)
        automaticallyManagesSubnodes = true
        automaticallyRelayoutOnSafeAreaChanges = true
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let ratioSpec = ASRatioLayoutSpec(ratio: 0.5, child: testNode)
        
        return ASInsetLayoutSpec(insets: safeAreaInsets, child: ratioSpec)
    }
}
