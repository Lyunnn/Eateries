//
//  DetailView.swift
//  EateriesCoreData
//
//  Created by Lin Yun Kee on 9/5/21.
//

import SwiftUI

struct ReviewTextField: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var reviews: Review
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TextField("Enter name", text: $reviews.nameStr, onCommit: {
                try? viewContext.save()
            })
            .onDisappear(perform: { try? viewContext.save() })
            TextField("Enter comment", text: $reviews.commentStr, onCommit: {
                try? viewContext.save()
            })
            .onDisappear(perform: { try? viewContext.save() })
            .multilineTextAlignment(.leading)
        }
    }
}

struct ReviewView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var reviews: Review
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("\(reviews.nameStr)")
            Text("\(reviews.commentStr)")
                .multilineTextAlignment(.leading)
        }
    }
}

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) var editMode
    @ObservedObject var restaurant: Restaurant
    var restImg: some View {
        let image = restaurant.image
            .resizable()
            .frame(width: 300, height: 250)
        return image
    }
    var editor: Bool {
        return editMode?.wrappedValue.isEditing ?? false ? true : false
    }
    var body: some View {
        if editor {
            TextField("Enter image url", text: $restaurant.imgURL, onCommit: {
                try? viewContext.save()
            })
            .onDisappear(perform: { try? viewContext.save() })
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 15.0)
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    TextField("Enter restaurant name", text: $restaurant.nameStr, onCommit: {
                        try? viewContext.save()
                    })
                    .onDisappear(perform: { try? viewContext.save() })
                    .font(Font.largeTitle.weight(.bold))
                    .multilineTextAlignment(.leading)
                    Spacer()
                    TextField("Enter location", text: $restaurant.locationStr, onCommit: {
                        try? viewContext.save()
                    })
                    .onDisappear(perform: { try? viewContext.save() })
                    .multilineTextAlignment(.leading)
                    Spacer()
                    Section(header:
                                HStack {
                                    Text("NOTES")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.yellow)
                                }
                    ) {
                        TextField("Enter restaurant notes", text: $restaurant.noteStr, onCommit: {
                            try? viewContext.save()
                        })
                        .onDisappear(perform: { try? viewContext.save() })
                        .multilineTextAlignment(.leading)
                    }
                    Spacer()
                    Section(header:
                                HStack {
                                    Text("REVIEWS")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.yellow)
                                })
                    {
//                        ForEach(restaurant.reviewArr, id: \.nameStr) { review in
//                            ReviewTextField(reviews: review)
//                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 15.0)
            }
        } else {
            restImg
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("\(restaurant.nameStr)")
                        .font(Font.largeTitle.weight(.bold))
                    Spacer()
                    Text("\(restaurant.locationStr)")
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Section(header:
                                HStack {
                                    Text("NOTES")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.yellow)
                                }
                    ) {
                        Text("\(restaurant.noteStr)")
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                    Section(header:
                                HStack {
                                    Text("REVIEWS")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.yellow)
                                })
                    {
//                        ForEach(restaurant.reviewArr, id: \.reviews.name) { review in
//                            ReviewView(reviews: review)
//                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 15.0)
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
