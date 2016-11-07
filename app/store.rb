class Store
  include Inesita::Injection

  WEBCAM_RES = [320,200]
  ASCII_RES  = [80, 40]

  def initialize
    @webcam = WebCam.new(*WEBCAM_RES)
    @canvas = Browser::Canvas.new(*ASCII_RES)
    @asciifyier = Asciifyier.new(@canvas)
  end

  def ascii
    if @webcam.video_ready?
      @canvas.draw_image(@webcam.data, 0, 0, ASCII_RES.first, ASCII_RES.last)
      @asciifyier.asciify
    end
  end
end
