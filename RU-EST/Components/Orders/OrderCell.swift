//
//  OrderCell.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 17/03/23.
//

import SwiftUI

struct OrderCell: View {
    
    let order: Order
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(order.name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text("\(Date.formattedDate(date: order.date))")
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell(order: Order(name: "Victor Ordozgoite", date: Date()))
    }
}
