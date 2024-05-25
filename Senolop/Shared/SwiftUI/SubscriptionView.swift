//
//  SubscriptionView.swift
//  Calculator
//
//  Created by Wallace Silva on 08/09/22.
//

import SwiftUI

protocol PayMachine {
    var value: Double { get }
    var description: String { get }
}

struct SubscriptionPayMachine: PayMachine {
    var value: Double {
        14.9
    }
    var description: String {
        "1 m"
    }
}

struct SubscriptionView: View {
    
    func pay() {
        
    }
    
    var body: some View {
        VStack {
            CreditsView()
            
            HStack {
                Text("Subscribe")
                    .font(.title)
                Button {
                    pay()
                } label: {
                    Text("Pay")
                        .font(.callout)
                }
            }
        }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}
