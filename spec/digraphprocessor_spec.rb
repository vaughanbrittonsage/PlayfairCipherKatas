require_relative '../../root/digraphprocessor'

describe DigraphProcessor do

  let(:processor) { DigraphProcessor.new }

  describe '#split' do

    it 'should split "Hide the gold in the tree stump" into 13 digraph pairs' do

      pairs = processor.split('Hide the gold in the tree stump')

      expect(pairs.length).to eq(13)

      expect(pairs[0]).to eq('HI')
      expect(pairs[1]).to eq('DE')
      expect(pairs[2]).to eq('TH')
      expect(pairs[3]).to eq('EG')
      expect(pairs[4]).to eq('OL')
      expect(pairs[5]).to eq('DI')
      expect(pairs[6]).to eq('NT')
      expect(pairs[7]).to eq('HE')
      expect(pairs[8]).to eq('TR')
      expect(pairs[9]).to eq('EX')
      expect(pairs[10]).to eq('ES')
      expect(pairs[11]).to eq('TU')
      expect(pairs[12]).to eq('MP')

    end

  end

  describe '#clean' do

    it 'should clean fill character X from TREXE and return TREE' do

      pre_clean_text = 'TREXE'

      post_clean_text = processor.clean(pre_clean_text)

      expect(post_clean_text).to eq('TREE')

    end

  end

end