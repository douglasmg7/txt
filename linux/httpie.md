# httpie
https://httpie.io/docs/cli

### Print only the request headers.
http -H http://127.0.0.1:3000/

### Print only the request body.
http -B http://127.0.0.1:3000/

### Print only the response headers.
http -h http://127.0.0.1:3000/

### Print only the response body.
http -b http://127.0.0.1:3000/

### Print only the elapsed time.
http -m http://127.0.0.1:3000/

### Print response headers, response body and elapsed time.
http -p=hbm http://127.0.0.1:3000/

### Print everything (request, response, and elapsed time).
http -vv example.com
