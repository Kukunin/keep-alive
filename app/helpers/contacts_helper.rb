module ContactsHelper
  def image_for_text(text)
    canvas = Magick::Image.new(text.chars.count * 10, 22)
    gc     = Magick::Draw.new

    gc.pointsize(15)
    gc.text(0, 15, text)
    gc.draw(canvas)

    canvas.format = 'png'

    Base64.encode64(canvas.to_blob).delete("\n")
  end

  def telegram_link(telegram)
    username = telegram.gsub(/\W/, '')

    "https://t.me/#{username}"
  end

  def skype_link(skype)
    "skype:#{skype}"
  end
end
