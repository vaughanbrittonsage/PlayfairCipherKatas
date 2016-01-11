class PlayFairTable

  attr_accessor :content
  attr_accessor :cells

  def initialize
    @content = [Array.new(5),Array.new(5),Array.new(5),Array.new(5),Array.new(5)]
    @cells = []
  end

  def set_value(column_index, row_index, value)

    #validate correct column & row index's have been specified.
    validate_column_index(column_index)
    validate_row_index(row_index)

    #set the value to the matrix
    @content[column_index][row_index] = value

    #remove previous cell
    @cells.delete_if { |cell| cell.column_index == column_index && cell.row_index == row_index }

    #create the cell
    cell = TableCell.new
    cell.column_index = column_index
    cell.row_index = row_index
    cell.value = value
    @cells.push(cell)

  end

  def get_value(column_index, row_index)

    #validate correct column & row index's have been specified.
    validate_column_index(column_index)
    validate_row_index(row_index)

    #get the corresponding value from the matrix
    @content[column_index][row_index]

  end

  def get_cell(value)
    @cells.find { |cell| cell.value == value }
  end

  private

  def validate_column_index(column_index)
    #check that the column index is within 0...4 range for zero index of 1-5
    if column_index > 4 || column_index < 0
      raise 'Invalid column index specified'
    end
  end

  def validate_row_index(row_index)
    #check that the row index is within 0...4 range for zero index of 1-5
    if row_index > 4 || row_index < 0
      raise 'Invalid row index specified'
    end
  end

end