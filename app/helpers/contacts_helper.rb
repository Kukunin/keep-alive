module ContactsHelper
  def protect_sensitive(text)
    return content_tag(:span, text) if current_user&.admin?

    image_tag "data:image/png;base64,#{image_for_text(text)}"
  end

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

  def instagram_link(instagram)
    username = instagram.gsub(/^@?/, '')

    "https://www.instagram.com/#{username}"
  end

  def skype_link(skype)
    "skype:#{skype}"
  end
end
