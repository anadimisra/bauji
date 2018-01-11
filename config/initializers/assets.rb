# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( certifications.js certifications.css )
Rails.application.config.assets.precompile += %w( coupons.js coupons.css )
Rails.application.config.assets.precompile += %w( discounts.js discounts.css )
Rails.application.config.assets.precompile += %w( job_posts.js job_posts.css )
Rails.application.config.assets.precompile += %w( learners.js learners.css )
Rails.application.config.assets.precompile += %w( offers.js offers.css )
Rails.application.config.assets.precompile += %w( orders.js orders.css )
Rails.application.config.assets.precompile += %w( workshops.js workshops.css )