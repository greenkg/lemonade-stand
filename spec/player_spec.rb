require 'player'

describe Player do
  describe 'cash?' do
    context 'create a new player' do
      it 'returns true' do
        player = Player.new
        expect(player.cash?).to eql(true)
      end
    end
  end
end
