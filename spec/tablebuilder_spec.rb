require_relative '../../root/tablebuilder'

describe TableBuilder do

  let(:builder) { TableBuilder.new }

  describe '#generate_alphabet' do

    it 'should return all 26 letters of the alphabet' do

      alphabet = builder.generate_alphabet

      expect(alphabet.length).to eq(26)
      expect(alphabet[0]).to eq('A')
      expect(alphabet[25]).to eq('Z')

    end

  end

  describe '#clean_phrase' do

    it 'should remove whitespace, duplicate characters and enforce uppercase' do

      phrase = 'Hello World'

      clean_phrase = builder.clean_phrase(phrase)

      expect(clean_phrase).to eq('HELOWRD')

    end

  end

  describe '#build' do

    it 'should fill a table for the phrase "Hello World" with the expected cells' do

      phrase = 'Hello World'

      table = builder.build(phrase)

      expect(table.get_value(0,0)).to eq('H')
      expect(table.get_value(1,0)).to eq('E')
      expect(table.get_value(2,0)).to eq('L')
      expect(table.get_value(3,0)).to eq('O')
      expect(table.get_value(4,0)).to eq('W')
      expect(table.get_value(0,1)).to eq('R')
      expect(table.get_value(1,1)).to eq('D')

      expect(table.get_value(2,1)).to eq('A')
      expect(table.get_value(3,1)).to eq('B')
      expect(table.get_value(4,1)).to eq('C')
      expect(table.get_value(0,2)).to eq('F')
      expect(table.get_value(1,2)).to eq('G')
      expect(table.get_value(2,2)).to eq('I')
      expect(table.get_value(3,2)).to eq('J')
      expect(table.get_value(4,2)).to eq('K')

      expect(table.get_value(0,3)).to eq('M')
      expect(table.get_value(1,3)).to eq('N')
      expect(table.get_value(2,3)).to eq('P')
      expect(table.get_value(3,3)).to eq('S')
      expect(table.get_value(4,3)).to eq('T')

      expect(table.get_value(0,4)).to eq('U')
      expect(table.get_value(1,4)).to eq('V')
      expect(table.get_value(2,4)).to eq('X')
      expect(table.get_value(3,4)).to eq('Y')
      expect(table.get_value(4,4)).to eq('Z')

    end

  end

end