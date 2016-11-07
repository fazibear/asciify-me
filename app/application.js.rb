require 'inesita'

require 'browser'
require 'browser/animation_frame'
require 'browser/canvas'
require 'browser/interval'

require_tree './lib'

require 'layout'
require 'store'

class Application
  include Inesita::Component

  inject Store

  def render
    component Layout
  end
end

$document.ready do
  app = Application.mount_to($document.body)

  r = proc do
    app.render!
    animation_frame { r.call }
  end
  r.call
end
