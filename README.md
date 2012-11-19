# AdminSpace

AdminSpace handle admin namespace, controllers, views in your application

## Installation

Using bundler:
In your Gemfile
```
  gem 'admin_space'
```

Or manually :
```
  gem install admin_space
```

## Usage

In routes.rb
```
  admin_space do
    root  to: 'base#index', type: 'your_first_model'
  end
```

In your models define attr_accessible:
```
  class User < ActiveRecord::Base
    attr_accessible :email, :password, :firstname, :lastname
  end
```

You can now access your admin space.

AdminSpace handle admin controller, you do not need to generate yours.
But if you want fancy controller, you can still define some :
```
  rails g controller admin_space::webblogs
```

In routes.rb
```
  admin_space do
    root  to: 'base#index', type: 'your_first_model'
    resources :webblogs
  end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

AdminSpace is released under the MIT license:

* http://www.opensource.org/licenses/MIT