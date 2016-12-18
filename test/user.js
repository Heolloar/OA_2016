var should = require('should');
var user = require('../src/user.js');

describe('tests', function() {
  it('get should return test', function(done){
    user.get("test",function(res){
      res.should.equal("test");
      done();
    })
  })
  
  it('get should not return test', function(done){
    user.get("test2",function(res){
      res.should.be.not.equal("test");
      done();
    })
  })

  it('save should return test', function(done){
    user.save("test",function(res){
      res.should.equal("test");
      done();
    })
  })
})
