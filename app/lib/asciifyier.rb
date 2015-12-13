class Asciifyier
  CHAR_LIST = '   .,:;i1tfLCG08@'.split('').reverse
  CHAR_LIST_LENGTH = CHAR_LIST.length - 1

  def initialize(canvas)
    @canvas = canvas
    @width = canvas.width
    @height = canvas.height
  end

  def asciify
    output = ''
    data = @canvas.data(0, 0, @width, @height)

    (0...@height).each do |y|
      (0...@width).each do |x|
        offset = (y * @width + x) * 4

        red   = data[offset]
        green = data[offset + 1]
        blue  = data[offset + 2]
        alpha = data[offset + 3]

        brightness = (0.3 * red + 0.59 * green + 0.11 * blue) / 255
        char_index = CHAR_LIST_LENGTH - (brightness * CHAR_LIST_LENGTH).round

        output += CHAR_LIST[char_index]
      end
      output += "\n"
    end
    output
  end
end
