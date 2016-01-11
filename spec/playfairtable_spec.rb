require_relative '../../root/playfairtable'
require_relative '../../root/tablecell'

describe PlayFairTable do

  let(:table) { PlayFairTable.new }

  describe '#set_value' do

    it 'should set char "A" to row 1 column 1' do
      table.set_value(1,1, 'A')
      char = table.content[1][1]

      expect(char).to eq('A')
    end

    it 'should raise an exception for an invalid column index' do
      expect { table.set_value(5, 4, 'A') }.to raise_error('Invalid column index specified')
    end

    it 'should raise an exception for an invalid row index' do
      expect { table.set_value(4, 5, 'A') }.to raise_error('Invalid row index specified')
    end

  end

  describe '#get_value' do

    it 'should get char "A" from row 1 column 1' do
      table.content[1][1] = 'A'
      char = table.get_value(1,1)

      expect(char).to eq('A')
    end

    it 'should raise an exception for an invalid column index' do
      expect { table.get_value(5, 4) }.to raise_error('Invalid column index specified')
    end

    it 'should raise an exception for an invalid row index' do
      expect { table.get_value(4, 5) }.to raise_error('Invalid row index specified')
    end

  end

  describe '#get_cell' do

    it 'should get cell for char "A" with a position of row 1 column 1' do
      table.set_value(1,1,'A')

      cell = table.get_cell('A')

      expect(cell.column_index).to eq(1)
      expect(cell.row_index).to eq(1)
    end

  end

end