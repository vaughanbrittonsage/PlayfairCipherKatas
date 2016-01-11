require 'pry'
class PlayFairCipher

  def initialize(table_builder, digraph_processor)
    @table_builder = table_builder
    @digraph_processor = digraph_processor
  end

  def encrypt(phrase, message)

    #create the cipher table for the phrase
    table = @table_builder.build(phrase)

    #split the message into digraph pairs
    pairs = @digraph_processor.split(message)

    encrypted_pairs = []

    pairs.each do |pair|

      chars = pair.split('')

      cell1 = table.get_cell(chars[0])
      cell2 = table.get_cell(chars[1])

      new_pair = ''

      #check if both characters are in the same column
      if cell1.column_index == cell2.column_index
        #get new row index's from 1 cell below unless at bottom and then get from top cell of the column
        c1_row_index = get_same_column_offset_index_forward(cell1.row_index)
        c2_row_index = get_same_column_offset_index_forward(cell2.row_index)

        #create cipher of the digraph pair
        new_pair += table.get_value(cell1.column_index, c1_row_index)
        new_pair += table.get_value(cell2.column_index, c2_row_index)

      elsif cell1.row_index == cell2.row_index
        #get new column index's from 1 cell to the right unless at far right and then get from left most cell of the row
        c1_column_index = get_same_row_offset_index_forward(cell1.column_index)
        c2_column_index = get_same_row_offset_index_forward(cell2.column_index)

        #create cipher of the digraph pair
        new_pair += table.get_value(c1_column_index, cell1.row_index)
        new_pair += table.get_value(c2_column_index, cell1.row_index)
      else
        #the characters form a rectangle on the table so swap first column with second column
        new_pair += table.get_value(cell2.column_index, cell1.row_index)
        new_pair += table.get_value(cell1.column_index, cell2.row_index)
      end

      encrypted_pairs.push(new_pair)

    end

    encrypted_pairs.join('')

  end

  def decrypt(phrase, encrypted_message)

    #create the cipher table for the phrase
    table = @table_builder.build(phrase)

    pairs = encrypted_message.scan(/../)

    decoded_pairs = []

    pairs.each do |pair|

      chars = pair.split('')

      cell1 = table.get_cell(chars[0])
      cell2 = table.get_cell(chars[1])

      new_pair = ''

      #below conditional block could be refactored into reusable conditional block due to similarities with encrypt logic, however
      #I have intentionally left this separated to allow different comments to explain the logic easier

      #check if both characters are in the same column
      if cell1.column_index == cell2.column_index
        #get new row index's from 1 cell above unless at top then get from bottom cell of the column
        c1_row_index = get_same_column_offset_index_back(cell1.row_index)
        c2_row_index = get_same_column_offset_index_back(cell2.row_index)

        #create decode of the cipher pair
        new_pair += table.get_value(cell1.column_index, c1_row_index)
        new_pair += table.get_value(cell2.column_index, c2_row_index)

      elsif cell1.row_index == cell2.row_index
        #get new column index's from 1 cell to the left unless at far left then get from right most cell of the row
        c1_column_index = get_same_row_offset_index_back(cell1.column_index)
        c2_column_index = get_same_row_offset_index_back(cell2.column_index)

        #create decode of the cipher pair
        new_pair += table.get_value(c1_column_index, cell1.row_index)
        new_pair += table.get_value(c2_column_index, cell1.row_index)
      else
        #the characters form a rectangle on the table so swap first column with second column
        new_pair += table.get_value(cell2.column_index, cell1.row_index)
        new_pair += table.get_value(cell1.column_index, cell2.row_index)
      end

      decoded_pairs.push(new_pair)

    end

    decoded_text = decoded_pairs.join('')

    #clean the decoded text to remove any fill characters
    @digraph_processor.clean(decoded_text)

  end

  private

  def get_same_column_offset_index_forward(row_index)
    0 if row_index + 1 > 4 else row_index + 1
  end

  def get_same_column_offset_index_back(row_index)
    4 if row_index - 1 < 0 else row_index - 1
  end

  def get_same_row_offset_index_forward(column_index)
    0 if column_index + 1 > 4 else column_index + 1
  end

  def get_same_row_offset_index_back(column_index)
    4 if column_index - 1 < 0 else column_index - 1
  end



end