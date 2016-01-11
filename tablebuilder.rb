require 'pry'
class TableBuilder

  def generate_alphabet
    #create an array to hold all the chars of the alphabet
    alphabet_chars = (97..(97+25)).map(&:chr).map!(&:upcase)
  end

  def clean_phrase(phrase)

    #ensure the phrase is a string
    if !phrase.is_a?(String)
      raise 'Phrase must be a string'
    end

    #clean the phrase removing duplicate letters, spaces and enforcing uppercase
    clean_phrase = phrase.delete(' ').upcase.split('').uniq.join('')

  end

  def build(phrase)

    cp = clean_phrase(phrase).split('')

    #generate the alphabet and remove the Q character
    alphabet = generate_alphabet
    alphabet.delete('Q')

    table = PlayFairTable.new

    #iterate through each cell of the table left to right, top to bottom
    for row_index in 0..4
      for column_index in 0..4

        char = ''

        #if the clean phrase contains any characters not added then add it to the current cell
        if cp.length > 0
          char = cp[0]
          table.set_value(column_index, row_index, char)
          #remove the used char from the clean_phrase array
          cp.delete(char)
          #remove the used char from the alphabet array so it doesn't get used again
          alphabet.delete(char)
        else
          #get the first available remaining character from the alphabet array
          char = alphabet[0]
          table.set_value(column_index, row_index, char)
          #remove the used char from the alphabet array
          alphabet.delete(char)
        end

      end
    end

    table

  end

end