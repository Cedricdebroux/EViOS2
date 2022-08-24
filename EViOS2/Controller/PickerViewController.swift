//
//  PickerViewController.swift
//  EViOS2
//
//  Created by Cédric Debroux on 23/08/2022.
//

import UIKit
import SafariServices

class PickerViewController: UIViewController {
    
    @IBOutlet var picker: UIPickerView!
    
    @IBOutlet var imagePokemon: UIImageView!
    
    @IBOutlet var backgrounfImage: UIView!
    var pokemons = [Pokemon]()
    var color = [Color]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPokemon()
        loadColor()
        picker.delegate = self
        picker.dataSource = self
    }
    
    
    @IBAction func moreInfo(_ sender: Any) {
        if let url = URL(string: NSLocalizedString("web_adress", comment: "")) {
            
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
            
        }
    }
    
    func loadColor(){
        color.append(Color(colorName: "Red", backGroundColor: .red))
        color.append(Color(colorName: "Blue", backGroundColor: .blue))
        color.append(Color(colorName: "Yellow", backGroundColor: .yellow))
        color.append(Color(colorName: "Purple", backGroundColor: .purple))
        color.append(Color(colorName: "Black", backGroundColor: .black))
        color.append(Color(colorName: "Green", backGroundColor: .green))
        color.append(Color(colorName: "White", backGroundColor: .white))
    }
    func loadPokemon(){
        pokemons.append(Pokemon(name: "Bulbizarre", image: UIImage(named: "Bulbizarre"), generation: 1,pokedexNumber: 001, height: 0.7, type: "Plante / Poisson" ))
        pokemons.append(Pokemon(name: "Herbizarre", image: UIImage(named: "Herbizarre"), generation: 2,pokedexNumber: 002, height: 1.0, type: "Plante / Poisson" ))
        pokemons.append(Pokemon(name: "Florizarre", image: UIImage(named: "Florizarre"), generation: 3,pokedexNumber: 003, height: 2.0, type: "Plante / Poisson" ))
        pokemons.append(Pokemon(name: "Salamèche", image: UIImage(named: "Salameche"), generation: 1,pokedexNumber: 004, height: 0.6, type: "Feu" ))
        pokemons.append(Pokemon(name: "Reptincel", image: UIImage(named: "Reptincel"), generation: 2,pokedexNumber: 005, height: 1.1, type: "Feu" ))
        pokemons.append(Pokemon(name: "Dracaufeu", image: UIImage(named: "Dracaufeu"), generation: 3,pokedexNumber: 006, height: 1.7, type: "Feu" ))
    }
    
    
    @objc func didTapSegmentControl(segmentedControl:UISegmentedControl){
        if segmentedControl.selectedSegmentIndex == 0 {
         
            imagePokemon.isHidden = false
            picker.isHidden = false
            
            
        }else{
            imagePokemon.isHidden = true
            picker.isHidden = true
        }
    }
}

extension PickerViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0 :
           return pokemons.count
        case 1 :
           return color.count
        default:
           return 0
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return pokemons[row].name
        case 1:
            return color[row].colorName
        default:
           return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
        switch component {
        case 0:
            imagePokemon.image = pokemons[row].image
        case 1:
            backgrounfImage.backgroundColor = color[row].backGroundColor
        default:
            return
        }
        
        }
    override func viewDidAppear(_ animated: Bool) {
        backgrounfImage.backgroundColor = .red
        imagePokemon.image = pokemons[0].image
    }
}

