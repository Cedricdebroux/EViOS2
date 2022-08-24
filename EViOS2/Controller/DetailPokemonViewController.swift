//
//  DetailPokemonViewController.swift
//  EViOS2
//
//  Created by Cédric Debroux on 24/08/2022.
//

import UIKit

class DetailPokemonViewController: UIViewController {

    @IBOutlet var pokemonImage: UIImageView!
    @IBOutlet var pokedex: UILabel!
    @IBOutlet var namePokemon: UILabel!
    @IBOutlet var typePokemon: UILabel!
    @IBOutlet var heightPokemon: UILabel!
    @IBOutlet var generationPokemon: UILabel!
    
    var pokemon: Pokemon!
    
    func setup(){
        namePokemon.text = pokemon.name
        typePokemon.text = pokemon.type
        pokedex.text = pokemon.pokedexNumber.description
        heightPokemon.text = pokemon.height.description
        generationPokemon.text = pokemon.generation.description
        pokemonImage.image = pokemon.image
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
