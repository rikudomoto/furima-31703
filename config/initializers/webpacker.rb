#require_relative '../config/application'
#Rails.application.initialize!
require_relative "../webpacker_env"
# Webpacker::Compiler.env["PAYJP_PUBLIC_KEY"] = Rails.application.credentials.payjp[:public_key]
# Webpacker::Compiler.env["PAYJP_SECRET_KEY"] = Rails.application.credentials.payjp[:secret_key]
require_relative '../config/application'
require_relative "../config/webpacker_env"
