//
//  GetSearchedURLs.swift
//  GiphyApp
//
//  Created by Surgeont on 12.01.2022.
//

import Foundation

class GetGIFManager {
    
    static let shared = GetGIFManager()
    private init() {
    }
    
    func getGifUrls(urlString: String, response: @escaping (Response?, Error?) -> Void) {
        NetworkService.shared.getData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let gifs = try JSONDecoder().decode(Response.self, from: data)
                    response(gifs, nil)
                } catch let responseError {
                    print("Wrong in decoding \(responseError.localizedDescription)")
                }
            case .failure(let error):
                print("Wrong in Search Service \(error.localizedDescription)")
                response(nil, error)
            }
        }
    }
}
