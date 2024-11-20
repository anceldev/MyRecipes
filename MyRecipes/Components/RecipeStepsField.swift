//
//  RecipeStepsField.swift
//  MyRecipes
//
//  Created by Ancel Dev account on 19/11/24.
//

import SwiftUI

struct RecipeStepsField: View {
    @State private var descriptionStep = ""
    @Binding var steps: [String]
    var body: some View {
        VStack {
            HStack {
                TextField("Step...", text: $descriptionStep)
                    .onSubmit {
                        addStep()
                    }
                Button {
                    addStep()
                } label: {
                    Label("Add step", systemImage: "plus")
                        .labelStyle(.iconOnly)
                }
                .frame(alignment: .trailing)
            }
            List {
                ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                    HStack {
                        Text(step)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
    private func addStep() {
        let index = steps.count + 1
        let newStep = "\(index). \(descriptionStep)"
        steps.append(newStep)
        descriptionStep = ""
    }
}
#Preview {
    NewRecipeForm()
}
