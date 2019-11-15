//
//  RootNode.swift
//  Texturan
//
//  Created by James Sraun on 12/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import AsyncDisplayKit

class CenterNode: ASDisplayNode {
    let testNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .blue
        node.style.preferredSize = CGSize(width: 100, height: 100)

        let innerCenterNode = ASDisplayNode()
        innerCenterNode.backgroundColor = .red
        innerCenterNode.style.preferredSize = CGSize(width: 50, height: 50)

        node.layoutSpecBlock = { _, constrainedSize in
            print("hehehe", constrainedSize)
            return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: innerCenterNode)
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
        let centerSpec = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: testNode)
        
        return centerSpec
    }
}
