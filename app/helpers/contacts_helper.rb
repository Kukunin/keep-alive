module ContactsHelper
  def image_for_text(text)
    file = ::Tempfile.new(['', '.png'])

    MiniMagick::Tool::Convert.new do |img|
      img.background 'transparent'
      img.fill '#000000'
      img.pointsize(15)
      img.size "#{text.chars.count * 10}x22"
      img << "caption: #{text}"
      img << file.path
    end

    Base64.encode64(file.read).delete("\n")
  end

  def telegram_link(telegram)
    username = telegram.gsub(/\W/, '')

    "https://t.me/#{username}"
  end

  def skype_link(skype)
    "skype:#{skype}"
  end
end
