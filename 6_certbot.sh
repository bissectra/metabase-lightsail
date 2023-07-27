# Step 6: Certbot Install and SSL Cert Setup
echo "Step 6: Installing Certbot and setting up SSL certificate"
sudo apt update && sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d metabase1.tutormundi.com -m caio.costa@tutormundi.com --agree-tos --non-interactive
echo "Certbot installation and SSL certificate setup completed."

echo "Metabase installation and configuration finished successfully!"
