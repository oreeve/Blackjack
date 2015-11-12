#!/usr/bin/env ruby
require_relative 'hand'
require_relative 'deck'
require_relative 'card'
require 'pry'

class Game
 attr_reader :deck, :p_hand, :d_hand
 attr_accessor :p_bust
  def initialize
    @deck = Deck.new
    @p_hand = Hand.new(deck)
    @d_hand = Hand.new(deck)
    @p_bust = false
    puts "Player's hand: #{p_hand.cards.join(' ')}"
    puts "Player Score: #{p_hand.score}"
  end

   def play
     player
     dealer
     winner
   end
   def player
    if p_hand.score == 21
      puts "Blackjack!"
      exit
    else
      print "Would you like to hit? (y/n)"
      answer = gets.chomp

      while answer == 'y' do
        p_hand.hit
        puts "Player's hand: #{p_hand.cards.join(' ')}"
        puts "Score: #{p_hand.score}"

        if p_hand.score > 21
          puts "Bust!"
          p_bust = true
          puts "Dealer Wins!"
          exit
        elsif p_hand == 21
          break
        else
          print "Would you like to hit? (y/n)"
          answer = gets.chomp
        end
      end
    end
  end
  def dealer
    if p_bust == false
      puts "Dealer's hand: #{d_hand.cards.join(' ')}"
      puts "Dealer Score: #{d_hand.score}"
      while d_hand.score < 17
        d_hand.hit
        puts "Dealer's hand: #{d_hand.cards.join(' ')}"
        puts d_hand.score
        if d_hand.score > 16 && d_hand.score < 21
          # puts "Dealer's hand: #{d_hand.cards.join(' ')}"
          puts "Dealer stays."
          break
        elsif d_hand.score == 21
          # puts "Dealer's hand: #{d_hand.cards.join(' ')}"
          puts "Dealer gets 21!"
          break
        elsif d_hand.score > 21
          # puts "Dealer's hand: #{d_hand.cards.join(' ')}"
          puts "Dealer busts!"
          break
        end
      end
    end
  end

   def winner
    if d_hand.score > p_hand.score && d_hand.score <= 21 || p_hand.score > 21
      puts "Dealer Wins!"
    elsif d_hand.score == p_hand.score
      puts "Push!"
    else
      puts "Player Wins!"
    end
  end
end
# game = Game.new
# game.play
