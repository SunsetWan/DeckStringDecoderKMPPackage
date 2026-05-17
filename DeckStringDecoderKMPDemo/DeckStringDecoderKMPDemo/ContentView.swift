//
//  ContentView.swift
//  DeckStringDecoderKMPDemo
//
//  Created by Sunset on 17/5/2026.
//

import SwiftUI
import DeckStringDecoder

enum DeckStringDemoFixtures {
    static let standardDeckCode = "AAECAQcCrwSRvAIOHLACkQP/A44FqAXUBaQG7gbnB+8HgrACiLACub8CAAA="
    static let sideboardDeckCode = "AAEBAZCaBgjlsASotgSX7wTvkQXipAX9xAXPxgXGxwUQvp8EobYElrcE+dsEuNwEutwE9vAEhoMFopkF4KQFlMQFu8QFu8cFuJ4Gz54G0Z4GAAED8J8E/cQFuNkE/cQF/+EE/cQFAAA="
}

enum DeckDecodeState: Equatable {
    case success(DeckDisplayModel)
    case failure(String)
}

struct DeckDisplayModel: Equatable {
    let formatText: String
    let heroText: String
    let mainCardCount: Int
    let sideboardCardCount: Int
    let rows: [DeckCardRow]

    init(deck: Deck) {
        self.formatText = deck.format.displayName
        self.heroText = deck.heroes.map(String.init).joined(separator: ", ")
        self.mainCardCount = deck.totalCardCount
        self.sideboardCardCount = deck.totalSideboardCardCount
        self.rows = deck.cards.map(DeckCardRow.init(card:))
            + deck.sideboardCards.map(DeckCardRow.init(sideboardCard:))
    }
}

struct DeckCardRow: Identifiable, Equatable {
    enum Source: Equatable {
        case main
        case sideboard(owner: Int)
    }

    let dbfId: Int
    let count: Int
    let source: Source

    var id: String {
        switch source {
        case .main:
            return "main-\(dbfId)"
        case .sideboard(let owner):
            return "sideboard-\(owner)-\(dbfId)"
        }
    }

    var sideboardOwner: Int? {
        guard case .sideboard(let owner) = source else { return nil }
        return owner
    }

    init(dbfId: Int, count: Int, source: Source) {
        self.dbfId = dbfId
        self.count = count
        self.source = source
    }

    init(card: Card) {
        self.dbfId = card.dbfId
        self.count = card.count
        self.source = .main
    }

    init(sideboardCard: SideboardCard) {
        self.dbfId = sideboardCard.dbfId
        self.count = sideboardCard.count
        self.source = .sideboard(owner: sideboardCard.sideboardOwner)
    }
}

enum DeckStringDemoDecoder {
    static func decode(_ input: String) -> DeckDecodeState {
        do {
            let deck = try DeckStringDecoder().decode(input.trimmingCharacters(in: .whitespacesAndNewlines))
            return .success(DeckDisplayModel(deck: deck))
        } catch let error as DeckStringError {
            return .failure(error.localizedDescription)
        } catch {
            return .failure(error.localizedDescription)
        }
    }

    static func encodedRoundTripMatches(_ input: String) throws -> Bool {
        let decoder = DeckStringDecoder()
        let deck = try decoder.decode(input.trimmingCharacters(in: .whitespacesAndNewlines))
        let encoded = try decoder.encode(deck)
        return try decoder.decode(encoded) == deck
    }
}

private extension DeckFormat {
    var displayName: String {
        switch self {
        case .unknown:
            return "Unknown"
        case .wild:
            return "Wild"
        case .standard:
            return "Standard"
        case .classic:
            return "Classic"
        case .twist:
            return "Twist"
        @unknown default:
            return "Unknown"
        }
    }
}

struct ContentView: View {
    @State private var deckCode = DeckStringDemoFixtures.standardDeckCode
    @State private var decodeState = DeckStringDemoDecoder.decode(DeckStringDemoFixtures.standardDeckCode)

    var body: some View {
        NavigationView {
            List {
                Section("Deck Code") {
                    TextEditor(text: $deckCode)
                        .font(.footnote.monospaced())
                        .frame(minHeight: 96)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .accessibilityIdentifier("deck-code-input")

                    Button {
                        decodeState = DeckStringDemoDecoder.decode(deckCode)
                    } label: {
                        Label("Decode", systemImage: "text.magnifyingglass")
                    }
                    .buttonStyle(.borderedProminent)
                    .accessibilityIdentifier("decode-button")
                }

                switch decodeState {
                case .success(let model):
                    Section("Summary") {
                        SummaryRow(title: "Format", value: model.formatText)
                        SummaryRow(title: "Heroes", value: model.heroText)
                        SummaryRow(title: "Main Cards", value: String(model.mainCardCount))
                        SummaryRow(title: "Sideboard", value: String(model.sideboardCardCount))
                    }

                    Section("Cards") {
                        ForEach(model.rows) { row in
                            CardRowView(row: row)
                        }
                    }

                case .failure(let message):
                    Section("Error") {
                        Text(message)
                            .foregroundColor(.red)
                            .accessibilityIdentifier("decode-error")
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Deck Decoder")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

private struct SummaryRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value.isEmpty ? "-" : value)
                .font(.body.monospacedDigit())
                .multilineTextAlignment(.trailing)
        }
    }
}

private struct CardRowView: View {
    let row: DeckCardRow

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("DBF \(row.dbfId)")
                    .font(.body.monospacedDigit())
                Spacer()
                Text("x\(row.count)")
                    .font(.body.monospacedDigit())
                    .foregroundColor(.secondary)
            }

            if let owner = row.sideboardOwner {
                Text("Sideboard owner \(owner)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .accessibilityElement(children: .combine)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
