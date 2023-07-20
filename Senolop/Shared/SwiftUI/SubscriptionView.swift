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
