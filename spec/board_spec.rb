require_relative "../lib/board"
require_relative "../lib/player"

RSpec.describe Board do
  let(:board) { Board.new }
  let(:player) { Player.new("P1") }

  describe "#initialize" do
    it "creates a board with 63 empty slots" do
      expect(board.get_slot(1)).to eq([])
      expect(board.get_slot(63)).to eq([])
    end
  end

  describe "#place_at" do
    it "places a player in a valid position" do
      expect(board.place_at(1, player)).to be true
      expect(board.get_slot(1)).to include(player)
    end

    it "allows multiple players in the same position" do
      player2 = Player.new("P2")
      board.place_at(1, player)
      board.place_at(1, player2)
      expect(board.get_slot(1)).to contain_exactly(player, player2)
    end

    it "returns false for invalid positions" do
      expect(board.place_at(0, player)).to be false
      expect(board.place_at(64, player)).to be false
    end
  end

  describe "#remove_from" do
    it "removes a player from a position" do
      board.place_at(1, player)
      expect(board.remove_from(1, player)).to be true
      expect(board.get_slot(1)).to be_empty
    end
  end
end 