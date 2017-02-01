EventEmitter = require('events').EventEmitter
nodemailer   = require 'nodemailer'
mailgun      = require 'nodemailer-mailgun-transport'


class OptuneMailer extends EventEmitter
    # private var that knows, if this mailer is already initialized
    _initialized: false
    _transporter: undefined
    _defaultFrom: undefined

    sendText: (to, subject, text, callback) ->
        if not @_initialized then @init()

        opts =
            from: @_defaultFrom
            to: to
            subject: subject
            text: text

        @_transporter.sendMail opts, (err, info) =>
            @emit('send', opts)
            callback( err, info )

    sendHtml: (to, subject, html, callback) ->
        if not @_initialized then @init()

        opts =
            from: @_defaultFrom
            to: to
            subject: subject
            html: html

        @_transporter.sendMail opts, (err, info) =>
            @emit('send', opts)
            callback( err, info )

    init: (defaultFrom, transporter) ->
        @_transporter = transporter or nodemailer.createTransport mailgun
            auth:
                api_key: process.env.MAILGUN_APIKEY
                domain: 'mails.onescreener.com'

        @_defaultFrom = defaultFrom or 'onescreener support <support@onescreener.com>'

        @_initialized = true
        @emit('init', @)


module.exports = new OptuneMailer
