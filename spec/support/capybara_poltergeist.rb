RSpec.configure do |config|
  Capybara.default_max_wait_time = 60 # Seconds to wait before timeout error. Default is 2

  Capybara.server_port = 52662

  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, inspector: true, debug: false)
  end

  Capybara.default_driver = :poltergeist
  Capybara.current_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
end
