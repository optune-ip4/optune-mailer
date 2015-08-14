EventEmitter = require('events').EventEmitter
nodemailer   = require 'nodemailer'


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

        @emit('send', opts)
        @_transporter.sendMail(opts, callback)

    sendHtml: (to, subject, html, callback) ->
        if not @_initialized then @init()

        opts =
            from: @_defaultFrom
            to: to
            subject: subject
            html: html

        @emit('send', opts)
        @_transporter.sendMail(opts, callback)

    init: (defaultFrom, transporter) ->
        mandrill = require 'nodemailer-mandrill-transport'

        @_transporter = transporter or nodemailer.createTransport mandrill
            auth:
                apiKey: process.env.MANDRILL_APIKEY

        @_defaultFrom = defaultFrom or 'optune.me <support@optune.me>'

        @_initialized = true
        @emit('init', @)


module.exports = new OptuneMailer
