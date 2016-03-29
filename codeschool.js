var shoe = {color: 'red'};
var s2 = Object.create(shoe);

console.log('s2: ' + s2.color);
s2.color = 'blue';

console.log('s2: ' + s2.color);
console.log('shoe:' + shoe.color);