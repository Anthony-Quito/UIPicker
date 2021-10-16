//
//  Pokedex.swift
//  Lab09
//
//  Created by MAC05 on 15/10/21.
//

import Foundation
//No necesita constructor
struct Pokedex: Codable {
    
    //Nombres y valores de la API
    let count: Int
    let results: [ListPokemon]
    
}
