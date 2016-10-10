should = require 'should'
user = require '../tp/src/user'

describe 'my coffee-script test series ', ->
  it 'get : should return tangui', ->
    user.get 'tangui', (res) ->
      res.should.equal 'tangui'

  it 'get : should return !tangui', ->
    user.get 'test', (res) ->
      res.should.be.not.equal 'tangui'

  it 'save : should return tangui', ->
    user.save 'tangui', (res) ->
      res.should.equal 'tangui'

  #it('should do smth else', function(done){...})
