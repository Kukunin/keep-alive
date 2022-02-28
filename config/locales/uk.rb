{
  uk: {
    number: {
      nth: {
        ordinals: ->(_key, number:, **_options) { '' },
        ordinalized: lambda { |_key, number:, **_options|
          "#{number}#{ActiveSupport::Inflector.ordinal(number)}"
        }
      }
    }
  }
}
