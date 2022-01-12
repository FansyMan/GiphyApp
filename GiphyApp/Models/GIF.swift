//
//  GIF.swift
//  GiphyApp
//
//  Created by Surgeont on 12.01.2022.
//

import Foundation

struct Response: Decodable {
    let results: [Datum]
    
    enum CodingKeys: String, CodingKey {
        case results = "data"
    }
    
}

struct Datum: Decodable {
    let imagesInfo: Images
    
    enum CodingKeys: String, CodingKey {
        case imagesInfo = "images"
    }
    
}

struct Images: Decodable {
    let lowGif: GifInfo
    
    enum CodingKeys: String, CodingKey {
        case lowGif = "preview_gif"
    }
}

// MARK: - The480_WStill
struct GifInfo: Decodable {
    let url: String
}

