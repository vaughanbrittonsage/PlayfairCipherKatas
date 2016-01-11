require_relative '../../root/playfaircipher'

describe PlayFairCipher do

  let(:table_builder) { TableBuilder.new }
  let(:digraph_processor) { DigraphProcessor.new }
  let(:cipher) { PlayFairCipher.new(table_builder, digraph_processor) }

  describe '#encrypt' do

    it 'should encrypt "Hide the gold in the tree stump" into "BMODZBXDNABEKUDMUIXMMOUVIF"' do

      phrase = 'playfair example'
      message = 'Hide the gold in the tree stump'
      encrypted_message = cipher.encrypt(phrase, message)

      expect(encrypted_message).to eq('BMODZBXDNABEKUDMUIXMMOUVIF')

    end

  end

  describe '#decrypt' do

    it 'should decrypt "BMODZBXDNABEKUDMUIXMMOUVIF" back into "Hide the gold in the tree stump"' do

      phrase = 'playfair example'
      cipher_text = 'BMODZBXDNABEKUDMUIXMMOUVIF'

      message = cipher.decrypt(phrase, cipher_text)

      expect(message).to eq('HIDETHEGOLDINTHETREESTUMP')

    end

  end

end