//
//  CharactersDataSource.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import UIKit
import AlamofireImage

class CharactersTableViewProvider: NSObject, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    private var charactersItems: [Character]
    var delegate: CharactersTableViewProtocol?

    init(items: [Character]) {
        self.charactersItems = items
        delegate?.offset = items.count
        super.init()
    }
    
    func updateItems(items: [Character]) {
        self.charactersItems = items
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
        cell.textLabel?.text = charactersItems[indexPath.row].name
        var image = UIImage(named: "placeHolder")
        image = image?.resizeImage(image: image!, targetSize: CGSize(width: 50, height: 150))
        cell.imageView?.image = image
        cell.imageView?.contentMode = .center
        cell.imageView!.af.setImage(withURL: URL(string: (cell.imageView!.imagePath(thumbnail: charactersItems[indexPath.row].thumbnail!, size: ImageSizeConstant.PORTRAIT_MEDIUM)))!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(item: charactersItems[indexPath.row], index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            delegate?.addFavorite(item: charactersItems[indexPath.row],index: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == charactersItems.count - 1   {
            delegate?.fecthCharactersItemNext(count: delegate!.offset)
            delegate?.offset += 30
        }
    }
}



