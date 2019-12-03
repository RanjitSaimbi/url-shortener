# README

This is a simple URL shortener app, built using the [Rails](http://rubyonrails.org) framework.

## Running Locally

Make sure you have [Ruby](https://www.ruby-lang.org) installed.

```sh
git clone the repository or download a fork
cd url-shortener
bundle
bundle exec rails server
```

The app should be running on http://localhost:3000.

You can make a POST request, as follows: 
```sh
curl -X POST -d '{"url": "www.farmdrop.com"}' -H "Content-Type: application/json" http://localhost:3000/
```
This will return a shortened URL:
```sh
{"short_url":"67d7","url":"http://www.farmdrop.com"}
```

You can make a GET request to a shortened url endpoint which will redirect you to the corresponding URL:
```sh
curl -X GET  http://localhost:3000/67d7
```

## Tests

Tests can be run as follows:
```sh
bundle exec rspec
```