optune-mailer
=============

Opinionated package for simplifying mailing via mailgun.com

[ ![Codeship Status for optune/optune-mailer](https://codeship.com/projects/9483dc80-0ba0-0133-52c5-265ef25499ca/status?branch=master)](https://codeship.com/projects/90874)

## Preconditions
1. CoffeeScript
2. A Mailgun account
3. Mandrill API Key in Env vars 


## Installation

    npm install optune-mailer --save


## Usage
    mailer = require 'optune-mailer'

    mailer.sendText 'Debug <debug@optune.me>', 'Test subject', 'Test body', callback

    # Events:
    mailer.on 'send', (opts) ->
        console.log opts
        # opts:
        #   from: ...
        #   to: ...
        #   subject: ...
        #   text or html: ...


## [Expected ENV Vars](http://12factor.net/config)
(For testing, put a .env file in the root with the following content)

    MAILGUN_APIKEY=YOUR_MAILGUN_API_KEY


## License
LGPL v3
