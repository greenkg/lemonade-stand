require "player"

describe Player do

  describe ".has_cash?" do
    context "create a new player" do
      it "returns true" do
        player = Player.new
        expect(player.has_cash?).to eql(true)
      end
    end
  end
  
end