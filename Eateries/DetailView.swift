//
//  DeatailView.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import SwiftUI

struct ReviewTextField: View {
    @ObservedObject var reviews: ReviewViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TextField("Enter name", text: $reviews.reviews.name, onCommit: {
                EateriesApp.save()
            })
            TextField("Enter comment", text: $reviews.reviews.comment, onCommit: {
                EateriesApp.save()
            })
                .multilineTextAlignment(.leading)
        }
    }
}

struct ReviewView: View {
    @ObservedObject var reviews: ReviewViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("\(reviews.reviews.name)")
            Text("\(reviews.reviews.comment)")
                .multilineTextAlignment(.leading)
        }
    }
}

struct DetailView: View {
    @Environment(\.editMode) var editMode
    @ObservedObject var restaurant: RestViewModel
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
            TextField("Enter image url", text: $restaurant.model.imgName, onCommit: {
                EateriesApp.save()
            })
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 15.0)
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    TextField("Enter restaurant name", text: $restaurant.model.restName, onCommit: {
                        EateriesApp.save()
                    })
                        .font(Font.largeTitle.weight(.bold))
                        .multilineTextAlignment(.leading)
                    Spacer()
                    TextField("Enter location", text: $restaurant.model.location, onCommit: {
                        EateriesApp.save()
                    })
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
                        TextField("Enter restaurant notes", text: $restaurant.model.note, onCommit: {
                            EateriesApp.save()
                        })
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
                        ForEach(restaurant.model.review, id: \.reviews.name) { review in
                            ReviewTextField(reviews: review)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 15.0)
            }
        } else {
            restImg
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("\(restaurant.model.restName)")
                        .font(Font.largeTitle.weight(.bold))
                    Spacer()
                    Text("\(restaurant.model.location)")
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
                        Text("\(restaurant.model.note)")
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
                        ForEach(restaurant.model.review, id: \.reviews.name) { review in
                            ReviewView(reviews: review)
                        }
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
//        DetailView(restaurant: Restaurant(imgName: "BSKT", restName: "BSKT Cafe", location: "4 Lavarack Rd, GC", note: "", review: [Review(name: "Lyun", comment: "Nice restaurant!")]))
//    }
//}

//Section {
//    TextField("Enter image url", text: $restaurant.model.imgName)
//}
//Section {
//    TextField("Enter restaurant name", text: $restaurant.model.restName)
//        .font(Font.largeTitle.weight(.bold))
//}
//Section {
//    TextField("Enter location", text: $restaurant.model.location)
//}
//Section(header:
//            HStack {
//                Text("NOTES")
//                    .font(.title3)
//                    .fontWeight(.bold)
//            }
//) {
//    TextField("Enter restaurant notes", text: $restaurant.model.note)
//        .multilineTextAlignment(.leading)
//}
//Section(header:
//            HStack {
//                Text("REVIEWS")
//                    .font(.title3)
//                    .fontWeight(.bold)
//            })
//{
//    ForEach(restaurant.model.review, id: \.reviews.name) { review in
//        ReviewTextField(reviews: review)
//    }
//}
