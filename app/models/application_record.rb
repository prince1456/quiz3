class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # config.autoload_paths += %w(#{config.root}/app/models/ckeditor)
end
