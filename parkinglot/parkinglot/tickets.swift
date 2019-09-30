//
//  tickets.swift
//  parkinglot
//
//  Created by Presan on 29/11/18.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation
class tickets
{
    
    private static var totalTickets = 0
        
    static func addTicket() -> Void {
        self.totalTickets += 1
    }
    
    static func getTotalTickets() -> Int{
        return totalTickets
    }
}
