//
//  WrapperNode.swift
//  Texturan
//
//  Created by James Sraun on 13/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import AsyncDisplayKit

class WrapperNode: ASDisplayNode {
    let blueNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .blue
        node.style.preferredSize = CGSize(width: 200, height: 200)
        
        return node
    }()
    
    let redNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .red
        node.style.flexGrow = 1
        
        return node
    }()
    
    let yellowNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .yellow
        node.style.flexGrow = 1
        
        return node
    }()
    
    override init() {
        super.init()
        backgroundColor = .init(white: 0.8, alpha: 1.0)
//        automaticallyManagesSubnodes = true
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        return ASWrapperLayoutSpec(layoutElement: blueNode)
        
        let spec1 = ASRelativeLayoutSpec(horizontalPosition: .end, verticalPosition: .center, sizingOption: .minimumSize, child: blueNode)
        
        let spec2 = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [redNode, yellowNode])
        
        return ASWrapperLayoutSpec(layoutElements: [spec1, spec2])
    }

}
