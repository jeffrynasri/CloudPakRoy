# CloudPakRoy

Load balancing menggunakan HTTP Proxy termasuk metode yang paling umum digunakan. Load balancing bekerja dengan cara mengarahkan trafik yang masuk pada Load Balancer ke web server yang menjalankan aplikasi.

3.2.1. Instalasi apache2 sebagai worker
Buat folder baru bernama vagrant-apache2-worker, kemudian jalankan vagrant init. Tambahkan box ubuntu 16.04 kemudian buatlah file bootstrap.sh. Tuliskan baris berikut:

sudo apt-get update
sudo apt-get install -y apache2
sudo apt-get install -y php5
Lakukan konfigurasi pada file Vagrantfile, tambahkan shell provisioning dengan file bootstrap.sh. Konfigurasi IP private menjadi 192.168.1.3. Jalankan vagrant up --provision untuk menjalankan virtual mesin. Masuk ke dalam virtual mesin dengan menggunakan perintah vagrant ssh . Pada folder /var/www/html tambahkan file index.php yang berisi:

<?php echo "hello world from worker 1" ?> 
Simpan file, uji dengan mengakses 192.168.1.3 pada browser.

3.2.2. Konfigurasi nginx sebagai load balancer
Masuk ke dalam virtual mesin nginx yang telah kita buat sebelumnya vagrant ssh. Lakukan backup file konfigurasi terlebih dahulu

cd /etc/nginx/sites-available
cp default default.bak
Ubah file default, tambahkan baris berikut diatas konfigurasi server.

upstream worker{
		least_conn;
        server 192.168.1.3:80;
}
Alamat 192.168.1.3 adalah alamat apache2 yang kita konfigurasi sebelumnya. Kemudian di dalam konfigurasi server pada baris berikut:

location / {
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.
        try_files $uri $uri/ =404;
        # Uncomment to enable naxsi on this location
        # include /etc/nginx/naxsi.rules
}
ubah menjadi

location / {
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.
        try_files $uri $uri/ =404;
        proxy_pass http://worker;
        # Uncomment to enable naxsi on this location
        # include /etc/nginx/naxsi.rules
}
perintah proxy_pass http://worker; akan memberitahu nginx untuk meneruskan paket ke worker yang telah kita definisikan sebelumnya di upstream worker. Restart nginx dan akses IP load balancer melalui browser. Akses http://192.168.1.2 pada url browser, maka akan tampil halaman hello world from worker 1 pada worker yang terinstall apache2. Buat satu lagi worker apache2 dengan alamat IP 192.168.1.4 lakukan provisioning apache2 dan php5 kemudian tambahkan halaman index.php berisi:

<?php echo "hello world from worker 2" ?> 
setelah worker kedua berhasil di provisioning, tambahkan alamat ip worker kedua pada upstream worker di konfigurasi nginx load balancer. Restart nginx dan coba akses kembali IP load balancer melalui browser. Lakukan refresh page beberapa kali dengan menekan tombol F5.

