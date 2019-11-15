//
//  TexturanViewController.swift
//  Texturan
//
//  Created by James Sraun on 12/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import AsyncDisplayKit

class TexturanViewController: ASViewController<ASDisplayNode> {
    enum List {
        case wrapperNode(title: String, node: ASDisplayNode)
        case relativeNode(title: String, node: ASDisplayNode)
        case centerNode(title: String, node: ASDisplayNode)
        case ratioNode(title: String, node: ASDisplayNode)
        case cornerNode(title: String, node: ASDisplayNode)
        case absoluteNode(title: String, node: ASDisplayNode)
        case layoutNode(title: String, node: ASDisplayNode)
        case overlayNode(title: String, node: ASDisplayNode)
        case backgroundNode(title: String, node: ASDisplayNode)
    }
    
    let list = [
        List.wrapperNode(title: "ASWrapperLayoutSpec", node: WrapperNode()),
        List.relativeNode(title: "ASRelativelayoutSpec", node: RelativeNode()),
        List.centerNode(title: "ASCenterLayoutSpec", node: CenterNode()),
        List.ratioNode(title: "ASRatioLayoutSpec", node: RatioNode()),
        List.cornerNode(title: "ASCornerLayoutSpec", node: CornerNode()),
        List.absoluteNode(title: "ASAbsoluteLayoutSpec", node: AbsoluteNode()),
        List.overlayNode(title: "ASOverlayLayoutSpec", node: OverlayNode()),
        List.backgroundNode(title: "ASBackgroundLayoutSpec", node: BackgroundNode()),
        List.layoutNode(title: "ASLayout", node: LayoutNode())
    ]
    
    init() {
        let tableNode = ASTableNode(style: .plain)
        super.init(node: tableNode)
        tableNode.delegate = self
        tableNode.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TexturanViewController: ASTableDelegate, ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let list = self.list[indexPath.item]
        let textNode = ASTextNode()
        let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
       
        switch list {
        case let .wrapperNode(arg),
             let .relativeNode(arg),
             let .centerNode(arg),
             let .ratioNode(arg),
             let .cornerNode(arg),
             let .layoutNode(arg),
             let .overlayNode(arg),
             let .backgroundNode(arg),
             let .absoluteNode(arg):
            textNode.attributedText = NSAttributedString(string: arg.title, attributes: attributes)
        }
        
        return {
            let cell = ASCellNode()
            cell.automaticallyManagesSubnodes = true
            cell.layoutSpecBlock = { (_,_) in
                return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), child: textNode)
            }
            
            return cell
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        let list = self.list[indexPath.item]
        var viewController: ASViewController<ASDisplayNode>
       
        switch list {
        case let .wrapperNode(arg),
             let .relativeNode(arg),
             let .centerNode(arg),
             let .ratioNode(arg),
             let .cornerNode(arg),
             let .layoutNode(arg),
             let .overlayNode(arg),
             let .backgroundNode(arg),
             let .absoluteNode(arg):
            viewController = ASViewController(node: arg.node)
            viewController.title = arg.title
        }
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

