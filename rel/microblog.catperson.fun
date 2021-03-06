server {
        listen 80;
        listen [::]:80;

        # root /home/nat/www/webshop; 

        # Add index.php to the list if you are using PHP
        # index index.html index.htm index.nginx-debian.html;

        server_name microblog.catperson.fun;

        location / {
        # Send all requests on to the Phoenix server.
                proxy_pass http://localhost:8000;
        }

        location ~* ^.+\.(css|cur|gif|gz|ico|jpg|jpeg|js|png|svg|woff|woff2)$ {
        # Except static assets. Serve those directly.
                root /home/catperson/src/microblog/priv/static;
                etag off;
                expires max;
                add_header Cache-Control public;
        }
}
