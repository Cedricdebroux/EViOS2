//
//  PokemonTableViewCell.swift
//  EViOS2
//
//  Created by Cédric Debroux on 23/08/2022.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    static let identifier = "PokemonTableViewCell"

    @IBOutlet var pokemonImage: UIImageView!
    @IBOutlet var pokemonName: UILabel!
    
    func setup(pokemon: Pokemon){
        pokemonName.text = pokemon.name
        pokemonImage.image = pokemon.image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
