module SubdomainHelper
  def set_subdomain(subdomain)
    site = "#{subdomain}.lvh.me"
    Capybara.app_host = "http://#{site}"
    Capybara.always_include_port = true

    default_url_options[:host] = site.to_s
  end
end

RSpec.configure do |c|
  c.include SubdomainHelper, type: :feature

  c.before type: :feature do
    Capybara.app_host = 'http://lvh.me'
  end
end
