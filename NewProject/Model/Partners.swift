//
//  Partners.swift
//  NewProject
//
//  Created by Nurba Seyilkhan on 15.03.2022.
//

import Foundation

//struct Partners: Codable {
//    let currentPartners: [CurrentPartners]
//}
//
//struct CurrentPartners: Codable {
//    let partnerId1, partnerId2, partnerId3: [PartnerID]
//}


class PartnerID{
    let name, partnerIDDescription, url: String

    enum CodingKeys: String, CodingKey {
        case name
        case partnerIDDescription = "description"
        case url
    }
    init(name: String,partnerIDDescription: String, url: String){
        self.name = name
        self.url = url
        self.partnerIDDescription = partnerIDDescription
        
    }

}



