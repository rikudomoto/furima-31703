require_relative '../config/application'
Rails.application.initialize!

Webpacker::Compiler.env["PAYJP_PUBLIC_KEY"] = Rails.application.credentials.payjp[:public_key]
Webpacker::Compiler.env["PAYJP_SECRET_KEY"] = Rails.application.credentials.payjp[:secret_key]