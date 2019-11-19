//
//  TexturanNode.swift
//  Texturan
//
//  Created by James Sraun on 15/11/19.
//  Copyright © 2019 tokopedia. All rights reserved.
//

import AsyncDisplayKit

class TexturanNode: ASDisplayNode {
    let productImageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage(named: "ipong_promaag")
        
        return node
    }()
    
    let productNameNode: ASTextNode = {
        let node = ASTextNode()
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        node.attributedText = NSAttributedString(string: "Iphone 11 Pro Max", attributes: attributes)
        node.style.width = ASDimensionMake("100%")
        
        return node
    }()
    
    let wishListButton: ASButtonNode = {
        let node = ASButtonNode()
        node.setImage(UIImage(named: "wishlist"), for: .normal)
        node.backgroundColor = .white
        node.style.preferredSize = CGSize(width: 50, height: 50)
        node.cornerRadius = 25
        node.borderColor = UIColor.lightGray.cgColor
        node.borderWidth = 0.5
        node.style.alignSelf = .start
        
        return node
    }()
    
    let seenStackSpec: ASLayoutSpec = {
        let titleNode = ASTextNode()
        let titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ]
        titleNode.attributedText = NSAttributedString(string: "Dilihat", attributes: titleAttributes)

        let totalNode = ASTextNode()
        let totalAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        totalNode.attributedText = NSAttributedString(string: "7,8rb", attributes: totalAttributes)

        let stackSpec = ASStackLayoutSpec(direction: .vertical,
                                          spacing: 4.0,
                                          justifyContent: .center,
                                          alignItems: .center,
                                          children: [titleNode, totalNode])
        return stackSpec
    }()
    
    let soldStackSpec: ASLayoutSpec = {
        let titleNode = ASTextNode()
        let titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ]
        titleNode.attributedText = NSAttributedString(string: "Transaksi Berhasil", attributes: titleAttributes)

        let totalNode = ASTextNode()
        let totalAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        totalNode.attributedText = NSAttributedString(string: "100%(1770)", attributes: totalAttributes)

        let stackSpec = ASStackLayoutSpec(direction: .vertical,
                                 spacing: 4.0,
                                 justifyContent: .center,
                                 alignItems: .center,
                                 children: [titleNode, totalNode])
            
        return stackSpec
    }()
    
    let wishlistStackSpec: ASLayoutSpec = {
        let titleNode = ASTextNode()
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ]
        titleNode.attributedText = NSAttributedString(string: "Wishlist", attributes: attributes)
        titleNode.backgroundColor = .none

        let totalNode = ASTextNode()
        let totalAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        
        totalNode.attributedText = NSAttributedString(string: "234rb",attributes: totalAttributes)
        totalNode.backgroundColor = .none
        
        let stackSpec = ASStackLayoutSpec(direction: .vertical,
                                 spacing: 4.0,
                                 justifyContent: .center,
                                 alignItems: .center,
                                 children: [titleNode, totalNode])
        return stackSpec
    }()
    
    let graybackgroundNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .init(white: 0.95, alpha: 1)
        node.cornerRadius = 6
        
        return node
    }()
    
    override init() {
        super.init()
        backgroundColor = .white
        automaticallyRelayoutOnSafeAreaChanges = true
        automaticallyManagesSubnodes = true
    }
}
