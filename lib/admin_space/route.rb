module ActionDispatch::Routing
  class Mapper
    def admin_space *args
      namespace :admin, module: :admin_space do
        with_options controller: :base do |admin|
          yield admin
        end

        # List all model and build routes
        models = []
        Dir.glob( 'app/models/*' ).each do |f|
          models << File.basename( f ).gsub( /^(.+).rb/, '\1')
        end

        models.each do |model|
          eval("resources :#{model.pluralize}, controller: :base")
        end
      end
    end
  end
end
