//
//  AbsoluteNode.swift
//  Texturan
//
//  Created by James Sraun on 14/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import AsyncDisplayKit

class AbsoluteNode: ASDisplayNode {
    
    let testNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .blue
        node.style.preferredSize = CGSize(width: 100, height: 100)
        node.style.layoutPosition = CGPoint(x: 100, y: 100)
        
        return node
    }()
    
    let testNode2: ASDisplayNode = {
           let node = ASDisplayNode()
           node.backgroundColor = .red
           node.style.preferredSize = CGSize(width: 100, height: 100)
           node.style.layoutPosition = CGPoint(x: 200, y: 200)
           
           return node
       }()
    
    override init() {
        super.init()
        backgroundColor = .init(white: 0.8, alpha: 1)
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let absoluteSpec = ASAbsoluteLayoutSpec(children: [testNode, testNode2])
        
        return ASInsetLayoutSpec(insets: safeAreaInsets, child: absoluteSpec)
    }
}
