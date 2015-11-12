require 'pry'
require_relative '../../lib/blackjack'
  describe Card do
     let(:card) { card = Card.new("♥", "A") }

    describe ".new" do
      it "creates a card with a suit and a value" do
        expect(card).to be_a(Card)
        expect(card.suit).to eq("♥")
        expect(card.value).to eq("A")
      end
    end

    describe "#type" do
      it "determines the type of card" do
        expect(card.type).to eq('Ace')
      end
    end
  end

  describe Deck do
   let(:deck) { Deck.new }

     describe "#build_deck" do
       it "builds a deck of 52 cards" do
         expect(deck.cards.size).to eq 52
       end
       it "creates unique cards" do
         expect(deck.cards.uniq.size).to eq 52
       end
       it "shuffles deck aftering being built" do
         expect(deck.cards.sort).to_not eq deck.cards
         expect(deck.cards.sort[0..1]).to eq ["10♠", "10♣"]
       end
     it "deals the top card in the deck" do
        correct_card = deck.cards[-1]
        expect(deck.deal).to eq (correct_card)
      end
    end
  end

  describe Hand do
    let(:hand) { hand = Hand.new(Deck.new)}

    describe ".new" do
      it "put two cards in the hand" do
        expect(hand.cards.count).to eq(2)
      end
    end

    describe "#hit" do
      it "adds a card the hand" do
        hand.hit
        expect(hand.cards.count).to eq (3)
      end
    end

    describe "#score" do
      it "calculates the sum of the cards in the hand" do
        expect(hand.score).to be <= (21)
      end
    end
  end

  describe Game do
    let(:game) {Game.new}

    describe ".new" do
      it "is a game object" do
        expect(game).to be_a(Game)
      end

      it "creates a player and hand with 2 cards each" do
        expect(game.p_hand).to be_a(Hand)
        expect(game.p_hand.cards.count).to eq(2)
        expect(game.d_hand).to be_a(Hand)
        expect(game.d_hand.cards.count).to eq(2)
      end
    end

    describe "#player" do
      it "returns a string" do
        allow(game.dealer).to receive(:gets).and_return('y')
        expect(game.dealer).to_not eq("".class)
      end
    end

    describe "#dealer" do
      it "returns a string" do
        expect(game.dealer).to_not eq("".class)
      end
    end

    describe "#winner" do
      it "returns a string" do
        expect(game.dealer).to_not eq("".class)
      end
    end
  end
