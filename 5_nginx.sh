
# Step 5: Nginx Install and Configuration
echo "Step 5: Nginx installation and configuration"
sudo apt-get update && sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx --no-pager
sudo unlink /etc/nginx/sites-enabled/default

# Create Metabase Nginx Config
echo "Step 5.1: Creating Metabase Nginx configuration"
sudo tee /etc/nginx/sites-available/metabase.conf > /dev/null << EOF
server {
    listen 80;
    proxy_read_timeout 600s;
    proxy_connect_timeout 120s;
    server_name metabase1.tutormundi.com;
    proxy_send_timeout 120s;
    location / {
        proxy_pass http://localhost:3000/;
    }
}
EOF
echo "Metabase Nginx configuration created."

# Create symlink and reload Nginx
echo "Step 5.2: Creating symlink and reloading Nginx"
sudo ln -s /etc/nginx/sites-available/metabase.conf /etc/nginx/sites-enabled/metabase.conf
sudo service nginx configtest && sudo service nginx restart
echo "Nginx installation and configuration completed."
