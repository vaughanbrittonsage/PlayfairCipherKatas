require 'pry'
class DigraphProcessor

  def initialize
    @fill_char = 'X'
  end

  def split(text)

    #verify that text is a string
    if !text.is_a?(String)
      raise 'Text must be a String'
    end

    #remove whitespace from text
    processed_text = text.delete(' ')

    #pre-process the text to make sure duplicate letters are seperated by the fill character
    char_index = 0
    chars = processed_text.split('')
    chars.each do |char|
      if char_index + 1 <= chars.length && chars[char_index] == chars[char_index + 1]
        processed_text.insert(char_index + 1, @fill_char)
      end
      char_index += 1
    end

    #if the text length is odd then end the text with the fill character to make the text even in length so it can be split into pairs
    if processed_text.length.odd?
      processed_text += @fill_char
    end

    #uppercase the text and return the digraph pairs
    processed_text.upcase.scan(/../)

  end

  def clean(text)

    char_index = 0
    chars = text.split('')
    cleaned_text = ''

    chars.each do |char|

      output = true

      if char == @fill_char && char_index > 0 && char_index + 1 < chars.length

        if chars[char_index - 1] == chars[char_index + 1]
          output = false
        end

      end

      if output == true
        cleaned_text += char
      end

      char_index += 1

    end

    cleaned_text

  end

end