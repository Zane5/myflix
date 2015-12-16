Myflix::Application.configure do

  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = false

  config.assets.compress = true
  config.assets.js_compressor = :uglifier

  config.assets.compile = false

  config.assets.digest = true

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  ActionMailer::Base.smtp_settings = {
    :port           => ENV['587'],
    :address        => ENV['sandboxda07c9c8a69c4fc588c1c51f5f071d5b.mailgun.org'],
    :user_name      => ENV['postmaster@sandboxda07c9c8a69c4fc588c1c51f5f071d5b.mailgun.org'],
    :password       => ENV['c38df6034d0e4cdb967959196b8b803a'],
    :domain         => 'fast-thicket-7432.herokuapp.com',
    :authentication => :plain,
}
  ActionMailer::Base.delivery_method = :smtp
end
