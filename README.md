## CareLibrary

#### Getting Started
```sh
# Install postgres, foreman, bundle
bundle install
# Write DATABASE_URL to .env
```

#### Development
```sh
foreman start
```

#### Testing
```sh
rake spec
```

#### Deployment
- [dokku](https://github.com/progrium/dokku)
- [dokku-psql-single-container](https://github.com/Flink/dokku-psql-single-container)

