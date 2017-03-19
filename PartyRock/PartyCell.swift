//
//  PartyCell.swift
//  PartyRock
//
//  Created by Laurent Liu on 19/03/2017.
//  Copyright © 2017 Laurent Liu. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func updateUI(partyRock: PartyRock) {
        
        videoTitleLabel.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                // handle the error
            }
        }
    }
}
