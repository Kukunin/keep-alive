if Rails.env.development?
  JsFromRoutes.config do |config|
    config.file_suffix = "Api.ts" # Generate TypeScript files.
  end
end
