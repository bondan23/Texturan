//
//  CornerNode.swift
//  Texturan
//
//  Created by James Sraun on 14/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import AsyncDisplayKit

class CornerNode: ASDisplayNode {
    
    let cornerNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .green
        node.style.preferredSize = CGSize(width: 20, height: 20)
        
        return node
    }()
    
    let childNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .red
        node.style.preferredSize = CGSize(width: 100, height: 100)
        
        return node
    }()
    
    override init() {
        super.init()
        backgroundColor = .init(white: 0.8, alpha: 1.0)
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let cornerSpec = ASCornerLayoutSpec(child: childNode, corner: cornerNode, location: .topRight)
        cornerSpec.offset = CGPoint(x: -10, y: 10)
        
        return ASCenterLayoutSpec(horizontalPosition: .center, verticalPosition: .center, sizingOption: .minimumSize, child: cornerSpec)
    }
}
