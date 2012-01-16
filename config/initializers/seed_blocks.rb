# SeedBlocks config
SEED_BLOCKS_ENGINE_CONFIG = {
    :app_name => "Endorse Liberty",
    :user_validations => []
}


# attempt to get compass working on EY
Rails.configuration.sass.tap do |config|
  config.load_paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/compass/stylesheets"
end