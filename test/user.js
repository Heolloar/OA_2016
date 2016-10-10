var should = require('should');
var user = require('../tp/src/user.js');

describe('my js test series', function() {
  it('get : should return tangui', function(){
    user.get("tangui",function(res){
      res.should.equal("tangui");
    })
  })

  it('get : should return !tangui', function(){
    user.get("test",function(res){
      res.should.be.not.equal("tangui");
    })
  })

  it('save : should return tangui', function(){
    user.save("tangui",function(res){
      res.should.equal("tangui");
    })
  })
  //it('should do smth else', function(done){...})
})
