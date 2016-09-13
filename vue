# install vue
npm install --save vue

# install vue-cli
npm install -g vue-cli

# create a new project using the webpack boilerplate
vue init webpack my-project
npm install
npm run dev

<span>Message: {{ msg }}</span>
update msg with the data change

<span>This will never change: {{* msg }}</span>
no update msg on data change

<div>{{{ raw_html }}}</div>
content is inserted as plain html
Dynamically rendering arbitrary HTML on your website can be very dangerous because it can easily lead to XSS attacks. Only use HTML interpolation on trusted content and never on user-provided content.



