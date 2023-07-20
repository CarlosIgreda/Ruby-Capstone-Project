require './music_albem'

RSpec.describe MusicAlbum do
  musicalbum = MusicAlbum.new
  describe '#music album' do
    it('returns instance of music album object') do
      expect(musicalbum).to be_instance_of(MusicAlbum)
    end
  end
end
