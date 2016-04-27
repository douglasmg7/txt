let users = [
	{login: 'Sam', admin: false},
	{login: 'Brook', admin: true},
	{login: 'Tyle', admin: true}];
let admin = users.find(user => user.admin);
console.log(admin);