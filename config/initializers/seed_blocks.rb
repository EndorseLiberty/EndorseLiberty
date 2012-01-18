host = case Rails.env
         when "production" then "endorseliberty.com"
         when "staging" then "elstg.com"
         else "ronpaul.local:3000"
       end

# SeedBlocks config
SEED_BLOCKS_ENGINE_CONFIG = {
    :app_name             => "Endorse Liberty",
    :user_validations     => [],
    :fb_app_id            => "103033659819435",
    :fb_app_secret        => "381f3a80f1f399f4121f532ec516de6e",
    :default_from_address => "contact@endorseliberty.com",
    :host                 => host,
    :http_basic_id        => "liberty",
    :http_basic_pass      => "3nd0r53"
}
