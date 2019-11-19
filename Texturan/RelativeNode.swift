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
}
