//
//  SubscriptionView.swift
//  Calculator
//
//  Created by Wallace Silva on 08/09/22.
//

import SwiftUI

struct SubscriptionView: View {
    
    func pay() {
        
    }
    
    var body: some View {
        VStack {
            Text("Subscription")
                .font(.title)
            Text("Deligthfull features waiting for you!")
                .font(.body)
            Button {
                pay()
            } label: {
                Text("Pay")
                    .font(.callout)
            }

        }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}
