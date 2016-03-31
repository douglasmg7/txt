function Fencepost(x, y, postNum) {
  this.x = x;
  this.y = y;
  this.postNum = postNum;
  this.connectionsTo = [];
}

Fencepost.prototype = {
  sendRopeTo: function(connectedPost) {
    this.connectionsTo.push(connectedPost);
  },
  removeRope: function(removeTo) {
    var temp = [];
    for (var i = 0; i < this.connectionsTo.length; i++) {
      if (this.connectionsTo[i].postNum != removeTo) {
        temp.push(this.connectionsTo[i]);
      }
    }
    this.connectionsTo = temp;
  },
  movePost: function(x, y) {
    this.x = x;
    this.y = y;
  },
  valueOf: function() {
  return Math.sqrt(this.x * this.x +
                   this.y * this.y);
  }
};

Fencepost.prototype.toSting = function() {
	var list = '';
  for (var i = 0; i < this.connectionsTo.length; i++){
    list += this.connectionsTo[i].postNum + '\n';
  }
  var s = 'Fence post #' + this.postNum + ':\nConnected to posts:\n' + list + 'Distance from ranch: ' + this.valueOf() + ' yards';
  console.log(s);
  return s;
};

var post1 = new Fencepost(3, 4, 100);
var post2 = new Fencepost(1, 1, 101);
var post3 = new Fencepost(2, 3, 102);
post1.sendRopeTo(post2);
post1.sendRopeTo(post3);

console.log(post1.toSting());

