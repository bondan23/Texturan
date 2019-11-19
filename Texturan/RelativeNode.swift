//
//  RelativeNode.swift
//  Texturan
//
//  Created by James Sraun on 12/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import AsyncDisplayKit

class RelativeNode: ASDisplayNode {
    let blueNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .blue
        node.style.preferredSize = CGSize(width: 100, height: 100)
        
        return node
    }()
    
    let redNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .red
        node.style.preferredSize = CGSize(width: 100, height: 100)
        
        return node
    }()
    
    let orangeNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .orange
        node.style.preferredSize = CGSize(width: 100, height: 100)
        
        return node
    }()
    
    override init() {
        super.init()
        backgroundColor = .init(white: 0.8, alpha: 1.0)
        automaticallyManagesSubnodes = true
        automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let relativeSpec = ASRelativeLayoutSpec()
        
        relativeSpec.horizontalPosition = .center
        relativeSpec.verticalPosition = .center
//        relativeSpec.sizingOption = .minimumSize
        relativeSpec.child = blueNode
        
        let relativeSpec2 = ASRelativeLayoutSpec()
        
        relativeSpec2.horizontalPosition = .start
        relativeSpec2.verticalPosition = .start
//        relativeSpec2.sizingOption =.
        relativeSpec2.child = redNode
        
        let relativeSpec3 = ASRelativeLayoutSpec()
        
        relativeSpec3.horizontalPosition = .end
        relativeSpec3.verticalPosition = .end
//        relativeSpec3.sizingOption = .minimumSize
        relativeSpec3.child = orangeNode
        
        let wrapperSpec = ASWrapperLayoutSpec(layoutElements: [relativeSpec, relativeSpec2, relativeSpec3])
        
        return ASInsetLayoutSpec(insets: safeAreaInsets, child: wrapperSpec)
    }
}
