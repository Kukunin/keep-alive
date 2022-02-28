# Load application custom translations in order to use them in other initializers
I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
I18n.default_locale = KeepAlive::Application.config.i18n.default_locale
