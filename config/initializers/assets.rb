# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( myjs.js )
Rails.application.config.assets.precompile += %w( editfun.js )
Rails.application.config.assets.precompile += %w( accordian.js )
Rails.application.config.assets.precompile += %w( admin_book.js )
Rails.application.config.assets.precompile += %w( admin_user_form.js )
Rails.application.config.assets.precompile += %w( live_search.js )
Rails.application.config.assets.precompile += %w( popup.js )


# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
