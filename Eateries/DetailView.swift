//
//  DeatailView.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.editMode) var editMode
    @ObservedObject var restaurant: Restaurant
    @ObservedObject var review: Review
    var body: some View {
        List {
            Section {
                TextField("Enter image url", text: $restaurant.imgName, onCommit:  {
                    EateriesApp.save()
                })
            }
            Section {
                TextField("Enter restaurant name", text: $restaurant.restName, onCommit:  {
                    EateriesApp.save()
                })
            }
            Section {
                TextField("Enter location", text: $restaurant.location, onCommit:  {
                    EateriesApp.save()
                })
            }
            Section(header:
                        HStack {
                            Text("NOTES")
                                .font(.title3)
                                .fontWeight(.bold)
                            Button(action: { withAnimation {  } }, label: { Image(systemName: "plus") })
                        }
            ) {
                TextField("Enter restaurant notes", text: $restaurant.note, onCommit:  {
                    EateriesApp.save()
                })
            }
            Section(header:
                        HStack {
                            Text("REVIEWS")
                                .font(.title3)
                                .fontWeight(.bold)
                            Button(action: { withAnimation {  } }, label: { Image(systemName: "plus") })
                        }
            ) {
                VStack {
                    TextField("Enter name", text: $review.name, onCommit:  {
                        EateriesApp.save()
                    })
                    TextField("Enter comment", text: $review.comment, onCommit:  {
                        EateriesApp.save()
                    })
                }
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
