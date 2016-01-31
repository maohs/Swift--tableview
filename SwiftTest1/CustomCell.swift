//
//  CustomCell.swift
//  SwiftTest1
//
//  Created by cao jie on 1/20/16.
//  Copyright (c) 2016 cao jie. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var iconImage:UIImageView!
    var titleLabel:UILabel!
    var directorLabel:UILabel!
    var timeLabel:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createIconImage()
        self.createTitleLabel()
        self.createDirectorLabel()
        self.createTimeLabel()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func createIconImage() {
        let cellWidth:CGFloat = self.frame.size.width
        let iconImageFrame:CGRect = CGRectMake(cellWidth/15, cellWidth/30, cellWidth/4, cellWidth/3);
        self.iconImage = UIImageView(frame: iconImageFrame)
        
        self.contentView.addSubview(iconImage)
    }
    
    
    func createTitleLabel() {
        let cellWidth:CGFloat = self.frame.size.width
        let titleFrame:CGRect = CGRectMake(cellWidth*2/5, cellWidth/30, cellWidth*2.5/5, cellWidth*1.5/10)
        self.titleLabel = UILabel(frame: titleFrame)
        titleLabel.textAlignment = NSTextAlignment.Left
        titleLabel.font = UIFont.boldSystemFontOfSize(18.0)
        titleLabel.numberOfLines = 0
        
        self.contentView.addSubview(titleLabel)
    }
    
    func createDirectorLabel() {
        let cellWidth:CGFloat = self.frame.size.width
        let directorFrame:CGRect = CGRectMake(cellWidth*2/5, (cellWidth/15 + cellWidth/10), cellWidth*3/5, cellWidth/10)
        self.directorLabel = UILabel(frame: directorFrame)
        directorLabel.font = UIFont.systemFontOfSize(17.0)
        
        self.contentView.addSubview(directorLabel)
    }
    
    func createTimeLabel() {
        let cellWidth:CGFloat = self.frame.size.width
        let timeFrame:CGRect = CGRectMake(cellWidth*2/5, cellWidth*2.5/10, cellWidth*3/5, cellWidth/10)
        self.timeLabel = UILabel(frame: timeFrame)
        timeLabel.font = UIFont.systemFontOfSize(17.0)
        
        self.contentView.addSubview(timeLabel)
    }
    
    
}
