# Automated Web Server Deployment with Nginx & Rsync

Bu proje, bulut altyapısı (DigitalOcean Droplet) üzerinde çalışan bir Nginx web sunucusunun yapılandırılmasını ve yerel makinedeki (Host) statik web sitesi içeriklerinin (HTML/CSS) endüstri standardı olan `rsync` aracı kullanılarak tek komutla, güvenli ve optimize bir şekilde canlıya (production) alınmasını içermektedir.

## Mimari ve Deployment Yaklaşımı

Geleneksel FTP veya SCP yöntemlerinin aksine, bu projede **Rsync (Remote Sync)** mimarisi tercih edilmiştir. `rsync`, yerel dizin ile uzak sunucu dizinindeki dosyaları bayt seviyesinde karşılaştırarak yalnızca **değişen veya yeni eklenen verileri** SSH tüneli üzerinden sıkıştırarak aktarır. Bu da deployment süreçlerinde muazzam bir hız ve bant genişliği tasarrufu sağlar.

### Proje Yapısı

    nginx-static-site/
    ├── public/
    │   ├── index.html      # Ana web sayfası
    │   └── style.css       # Stil kodları
    ├── deploy.sh           # Otomasyon ve Senkronizasyon Betiği (Shell Script)
    └── README.md           # Proje Dokümantasyonu

## Otomasyon Betiği (`deploy.sh`)

Yazılan kabuk betiği, karmaşık terminal parametrelerini soyutlayarak süreci tek komuta indirger:

```bash
#!/bin/bash
rsync -avz --delete public/ sunucum:/var/www/html/

https://roadmap.sh/projects/static-site-server
