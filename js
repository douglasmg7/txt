scratchpad - mozzila
shift + f4

solicita a confirmação do usuário
confirm('confiramr');

solicita uma informação do usuário
prompt('qual a sua idade?')

primitive types
string, number, boolean, null e undefined
typeof asdf - obtem o tipo da variável asdf
typeof (asdf) - obtem o tipo da variável asdf
void (expression)
void expression // the void operator specifies an expression to be evaluated without returning a value

string
length
substring()
var = 'asdf asda ds \
continuar na próxima linha'
toLowerCase()
toUpperCase()

number
parseInt(,) // radix parameter 8, 16, 10
parseFloat()
+'1' // converte para number
Nan // not a number
isNaN // verify if is a number

array
var pilha = [1, 2, 3]
pilha.push(4) // adiciona um ítem no final do array
delete a[1] // delete the element
a[1] // undefined
a[2] = undefined
a[2] // undefined
1 in pilha // false
2 in pilha // true

math
% - módulo

function
var name = function() {}

var
the var keyword creates a new variable in the current scope (function)
javaScript does not have block statement scope
variables in JavaScript are in a sense "hoisted" or lifted to the top of the function or statement
window is the global object in the browser

object
You should not use an object literal at the beginning of a statement. This will lead to an error or not behave as you expect, because the { will be interpreted as the beginning of a block
ex = {a:'asdf', 7:'estranhao'} // objeto literal válido - ex[7]
'a' in ex // true - the property exist
delete obj // delete a object
delete obj.prop // delete a property
If the delete operator succeeds, it sets the property or element to undefined. The delete operator returns true if the operation is possible; it returns false if the operation is not possible
var myString = new String("coral")
"length" in myString;  // true

object constructor
function Person(name,age) {
  this.name = name;
  this.age = age;
  this.calcBorn = function(){}
}

var theDay = new Date(1995, 12, 17);
if (theDay instanceof Date) {
  // statements to execute
}

create a method
var setValue(value) = {this.value = value}
obj.setValue = setValue

literal notation
var person = {
	name: 'Nicholas',
	sayName: function(){
		alert(this.name)
	}
}

constructor notation
var person = new Object()
person.name = 'Nicholas'
person.sayName = function(){
	alert(this.name)
}

return true if objet has the property name
myObj.hasOwnProperty('name')

print all property of object nyc
for(var prop in nyc)
{
    console.log(prop)   
}

add a method for all objects instances of class Dog
Dog.prototype.bark = function() {
  console.log("Woof");
};

make Emperor inherit Penguin
Emperor.prototype = new Penguin()

Characteristics of properties are defined through the use of internal-only attributes

[[]]
to indicate that an attribute is internal

ther are two types of properties
	data properties
		[[Configurable]]
			can be removed via delete
			property's attributes can be change
			can be changed via accessor property
		[[Enumerable]]
			indicate that property will be returned in a for-in loop
		[[Writable]]
			indicate that property's value can be changed
		[[Value]]
			contains the actual data value for the property

	acessor properties
		[[Configurable]]
			can be removed via delete
			property's attributes can be change
			can be changed via accessor property
		[[Enumerable]]
			indicate that property will be returned in a for-in loop
		[[Get]]
			the function to call when the property is read from
		[[Set]]
			the function to call when the property is written to

how to define an accessor property
	Object.defineProperty(book, “year”, {
		get: function(){return this._year;},
		set: function(newValue)
			{
			  if (newValue > 2004) 
			    {
			      this._year = newValue;this.edition += newValue - 2004;
			    }
                         }
                 });
	var person = {}
or
book.__defineGetter__('year', function(){})
book.__defineSetter__('year', function(){})

how to define an property
	Object.defineProperty(person, 'name', {
		writable: false, 
		value: 'Nicholas'
	})

how get the property description
var descriptor = Object.getOwnPropertyDescriptor(obj, “prop”)

Once a property has been defined as nonconfigurable, it cannot become configurable again. Any attempt to call Object.defineProperty() and change any attribute other than writable causes an error

window
the global context in web browser

When a variable is declared using var ,it is automatically added to the most immediate context
available. In a function, the most immediate one is the function’s local context; in a with statement, the most immediate is the function context

var t = 2  // declarada, faz parte do contexto mais interno
t = 2 // inicializada sem ser declarada, faz parte do contexto global

argumets.callee
is a pointer to the function that owns the arguments object

function.caller
is a pointer back to the caller function

define this when call a function
function.apply(this, arguments)
function.apply(this, [arg1, arg2])
function.call(this, arg1, arg2)

bind function to a this
var objectSayColor = sayColor.bind(o)
objectSayColor(); // this = o

make a wrapper - you can add properties
s = new String('aas')
n = new Number(2)
b = new Boolean(true)
x = new Object('asda')

casting
x = '23'
y = Number(x)

create a constructor
function Person(name){
	this.name = name
}

create a object person
p = new Person('Claudio')

constructor point to function ctor
p.constructor == Person // true

pseudoclassical inheritance
function SuperType(name){
	this.name = name;
	this.colors = [“red”, “blue”, “green”];
}

SuperType.prototype.sayName = function(){
	alert(this.name);
};

function SubType(name, age){
	//inherit properties
	SuperType.call(this, name);
	this.age = age;
}

//inherit methods
SubType.prototype = new SuperType();
SubType.prototype.sayAge = function(){
	alert(this.age);
};

global variables cannot be removed using the delete operator, while properties defined directly on window can

// deprecated
for each (variable in object) {
  statement
}

// all emacs
for (var prop in obj) {
  console.log("obj." + prop + " = " + obj[prop]);
}

// emacs 6
for (let i of arr) {
   console.log(i); // logs "3", "5", "7"
}