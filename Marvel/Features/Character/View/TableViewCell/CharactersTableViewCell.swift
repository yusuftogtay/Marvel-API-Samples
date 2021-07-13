//
//  CharactersTableViewCell.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    enum Identifier: String {
        case custom = "characterCell"
    }
    
    @IBOutlet weak var customImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func generateItem(item: Character) {
        nameLabel?.text = item.name ?? ""
        customImageView?.af.setImage(withURL: URL(string: (customImageView.imagePath(thumbnail: item.thumbnail!, size: ImageSizeConstant.PORTRAIT_FANTASTIC)))!)
    }
}
