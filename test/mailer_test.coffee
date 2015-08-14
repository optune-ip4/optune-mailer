require('dotenv').load()

expect   = require('chai').expect
path     = require 'path'

mailer   = require '../src/mailer'


describe 'mailer', ->
    @timeout(10000)

    it 'uninitialized before first usage', ->
        expect( mailer._initialized ).to.be.false

    it 'send a mail (simplest api)', (done) ->
        mailer.sendText 'Debug <debug@optune.me>', 'Test subject', 'Test body', (err, info) ->
            expect( info?.accepted?.length ).to.equal(1)
            done(err)

    it 'initalize automatically', ->
        expect( mailer._initialized ).to.be.true

    it 'does not reinitalize on rerequire (singleton)', ->
        m = require '../src/mailer'
        expect( m._initialized ).to.be.true

    it 'emit event on mail', (done) ->
        mailer.on 'send', (opts) ->
            expect( opts.text ).to.equal('test')
            done()

        mailer.sendText 'Debug <debug@optune.me>', 'Test subject', 'test', (err, info) ->
            if err then done(err)

