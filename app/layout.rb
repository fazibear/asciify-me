class Layout
  include Inesita::Layout

  def render
    header do
      pre { '   _____                .__.__  _____         _____        ._.
  /  _  \   ______ ____ |__|__|/ ____\__.__. /     \   ____| |
 /  /_\  \ /  ___// ___\|  |  \   __<   |  |/  \ /  \_/ __ \ |
/    |    \\\\___ \\\\  \___|  |  ||  |  \___  /    Y    \  ___/\|
\____|__  /____  >\___  >__|__||__|  / ____\____|__  /\___  >_
        \/     \/     \/             \/            \/     \/\/'}
      pre do
        'Make sure you\'re using https://, grant permission to your cam, and enjoy!'
      end
    end
    section do
      pre do
        text store.ascii
      end
    end
    footer do
      pre do
        text 'Made with '
        a href: 'http://inesita-rb.github.io' do
          'Inesita'
        end
        text '. Source available on '
        a href: 'https://github.com/inesita-rb/asciify-me' do
          'github'
        end
        text '. Enjoy!'
      end
    end
  end
end
