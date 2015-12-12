class WebCam
  def initialize(width, height)
    @video = $document.create_element(:video, { autoplay: 1,
                                                width: width,
                                                heigh: height
                                              })
    user_media(
      { video: true },
      ->(stream) { @video.set_attribute(:src, create_object_url(stream)) }
    )
  end

  def data
    @video if video_ready?
  end

  def video_ready?
    `#{@video.to_s}.readyState == #{@video.to_s}.HAVE_ENOUGH_DATA`
  end

  private

  def user_media(params = {}, video = -> {}, error = -> {})
    `navigator.getUserMedia = navigator.getUserMedia ||
                              navigator.webkitGetUserMedia ||
                              navigator.mozGetUserMedia ||
                              navigator.msGetUserMedia ||
                              navigator.oGetUserMedia;

    if(navigator.getUserMedia) {
      navigator.getUserMedia(#{params.to_n}, #{video}, #{error});
    }`
  end

  def create_object_url(stream)
    `return window.URL.createObjectURL(#{stream})`
  end
end
