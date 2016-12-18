should=require("should")
user=require("../src/user.coffee")

describe 'Tests', ->
    	
    it 'get should return test', ->
   		user.get 'test', (res) ->
   			res.should.equal 'test'

    
    it 'get should not return test', ->
    	user.get 'test2', (res) ->	
    		res.should.be.not.equal 'test'        

    	
    it 'get should return test', ->
    	user.save 'test', (res) ->
    		res.should.equal 'test'        