require 'inesita'

require 'browser/canvas'
require 'browser/interval'

require_tree './lib'

require 'layout'
require 'store'

$document.ready do
  app = Inesita::Application.new(
    store: Store,
    layout: Layout
  ).mount_to($document.body)

  r = proc do
    app.render!
    animation_frame { r.call }
  end
  r.call
end
