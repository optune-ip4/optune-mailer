optune-mailer
=============

Opinionated package for simplifying mailing via mandrill.com

## Preconditions
1. CoffeeScript
2. A Mandrill account
3. Mandrill API Key in Env vars 


## Installation

    npm install scrollfit --save


## Usage
    mailer = require 'optune-mailer'

    mailer.sendText 'Debug <debug@optune.me>', 'Test subject', 'Test body', callback


## [Expected ENV Vars](http://12factor.net/config)
(For testing, put a .env file in the root with the following content)

    MANDRILL_APIKEY=YOUR_MANDRILL_API_KEY


## License
LGPL v3
