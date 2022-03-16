//
//  Partners.swift
//  NewProject
//
//  Created by Nurba Seyilkhan on 15.03.2022.
//

import Foundation
import UIKit

//struct Partners: Codable {
//    let currentPartners: [CurrentPartners]
//}
//
//struct CurrentPartners: Codable {
//    let partnerId1, partnerId2, partnerId3: [PartnerID]
//}


class PartnerID{
    let name, url: String
    let logo: String?

    enum CodingKeys: String, CodingKey {
        case name
        case url
        case logo
    }
    init(name: String, url: String, logo: String?){
        self.name = name
        self.url = url
        self.logo = logo
    }

}



