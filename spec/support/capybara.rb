Capybara.javascript_driver = :selenium_chrome_headless
Capybara.register_driver :chrome do |app|
  args = %w(headless disable-gpu mute-audio window-size=1280,800 lang=ja)

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chrome_options: {
        args: args,
        # NOTE: 以下オプションつけないとCIエラーになる unknown command: Cannot call non W3C standard command while in W3C mode
        # SEE: https://bugs.chromium.org/p/chromedriver/issues/detail?id=2536
        # https://www.sonicgarden.world/groups/13/entries/718388
        w3c: false,
      }
    )
  )
end
