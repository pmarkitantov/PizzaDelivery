//
//  CounterView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 30/01/2024.
//

import SwiftUI

enum AdjusterViewPreviews {
    @State static var count = 1
}

struct AdjusterView: View {
    @Binding var count: Int

    var body: some View {
        HStack {
            Button {
                if count > 1 { count -= 1 }
            } label: {
                Image(systemName: "minus.circle")
                    .foregroundStyle(.red)
                    .font(.title3)
            }

            Text("\(count)")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal, 5)

            Button {
                count += 1
            } label: {
                Image(systemName: "plus.circle")
                    .foregroundStyle(.green)
                    .font(.title3)
            }
        }
    }
}

#Preview {
    AdjusterView(count: AdjusterViewPreviews.$count)
}
