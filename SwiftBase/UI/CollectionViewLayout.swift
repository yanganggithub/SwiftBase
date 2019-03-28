//
//  CollectionViewLayout.swift
//  kumu
//
//  Created by mac on 10/05/2018.
//  Copyright © 2018 hw. All rights reserved.
//

import UIKit
import OCBase


@objc protocol CollectionViewLayoutDelegate {
    
    @objc optional func heightOfSectionHeaderForIndexPath(_ indexPath:IndexPath)->CGFloat
    @objc optional func heightOfSectionFooterForIndexPath(_ indexPath:IndexPath)->CGFloat
    func curFrameOfCellForIndexPath(indexPath:IndexPath, curFrameModel:LayoutAttributeModel)->LayoutAttributeModel
    @objc optional func dataSourceOfCollectionViewLayout()->[UICollectionViewGroupLayoutAttributes]
    
    
    
}

class CollectionViewLayout: UICollectionViewFlowLayout {
    
    var layoutModel:LayoutAttributeModel!
    var attrsArr :[UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
    
    weak var delegate :CollectionViewLayoutDelegate?
    
    override func prepare(){
        super.prepare()
        layoutModel = LayoutAttributeModel()
        layoutModel.nextPointY = 0
        layoutModel.computeY = 0
        layoutModel.layoutFrame = CGRect.zero
        var tmpAttributesArr = [UICollectionViewLayoutAttributes]()
        let dataSource = delegate?.dataSourceOfCollectionViewLayout?()
        if let dataSource = dataSource {
            let sectionCount = dataSource.count
           
            for i in 0..<sectionCount{
                let groupAttribute = dataSource[i]
                if groupAttribute.sectionHeaderClassName != nil{
                    let attrHeader = self.layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, at: IndexPath.init(item: 0, section: i))
                    if let _ = attrHeader {
                        tmpAttributesArr.append(attrHeader!)
                    }

                }
                
                let itemCount = groupAttribute.cellLayoutAttributesArr.count
                for j in 0..<itemCount
                {
                    let item = IndexPath.init(item: j, section: i)
                    let attr = self.layoutAttributesForItem(at: item)
                    if let _ = attr {
                        tmpAttributesArr.append(attr!)
                    }
                    
                }
                
                if groupAttribute.sectionFooterClassName != nil{
                    let attrFooter = self.layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, at: IndexPath.init(item: 0, section: i))
                    if let _ = attrFooter {
                        tmpAttributesArr.append(attrFooter!)
                    }
                }
                
            }
            
            attrsArr = tmpAttributesArr
        }
        
     
    }
    
    override var collectionViewContentSize: CGSize{
        if self.layoutModel != nil {
             return CGSize.init(width: self.collectionView!.bounds.size.width, height: CGFloat(self.layoutModel.nextPointY))
        }
         return CGSize.init(width: self.collectionView!.bounds.size.width, height: self.collectionView!.bounds.size.height)
        
    }
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {

      let layoutAttributes =   UICollectionViewLayoutAttributes.init(forSupplementaryViewOfKind: elementKind, with: indexPath)
        var height:CGFloat? = 0
        if elementKind == UICollectionView.elementKindSectionHeader{
            let secion = indexPath.section
            let dataSource = delegate?.dataSourceOfCollectionViewLayout?()
            if let dataSource = dataSource {
              let  groupAttribute = dataSource[secion]
                height = groupAttribute.sectionHeaderHeight
                layoutModel.layoutFrame = CGRect.init(x: 0, y: layoutModel.nextPointY, width: UIScreen.main.bounds.size.width, height: height ?? 0)
            
               
            }
                
           
        }else {
            
            let secion = indexPath.section
            let dataSource = delegate?.dataSourceOfCollectionViewLayout?()
            if let dataSource = dataSource {
                let  groupAttribute = dataSource[secion]
                height = groupAttribute.sectionFooterHeight
                layoutModel.layoutFrame = CGRect.init(x: 0, y: layoutModel.nextPointY, width: UIScreen.main.bounds.size.width, height: height ?? 0)
            
           
            }
           
        }
        layoutAttributes.frame = layoutModel.layoutFrame
        if let height = height {
            self.layoutModel.nextPointY = self.layoutModel.nextPointY + height
            self.layoutModel.computeY = self.layoutModel.nextPointY
        }
        
        return layoutAttributes
        
    }
    
    // 所有单元格位置属性
    override func layoutAttributesForElements(in rect: CGRect)
        -> [UICollectionViewLayoutAttributes]? {
           return self.attrsArr
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath)
        -> UICollectionViewLayoutAttributes? {

           let layoutAttributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)

            
            self.layoutAttributesForItemLayout(layoutAttributes, indexPath: indexPath)
            return layoutAttributes
    }
    
  
    
   
    
    func layoutAttributesForItemLayout(_ layoutAttributes:UICollectionViewLayoutAttributes, indexPath:IndexPath){
       
        let layoutModel =  delegate?.curFrameOfCellForIndexPath(indexPath:indexPath,curFrameModel: self.layoutModel)
        self.layoutModel = layoutModel
        layoutAttributes.frame = self.layoutModel.layoutFrame

    }

}
