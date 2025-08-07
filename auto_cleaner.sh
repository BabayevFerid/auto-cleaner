#!/bin/bash

LOG_DIR="./logs"
LOG_FILE="$LOG_DIR/cleaner.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

mkdir -p "$LOG_DIR"

log() {
    echo "[$DATE] $1" | tee -a "$LOG_FILE"
}

log "🧼 Sistem təmizləməyə başlanıldı."

# 1. Paketlər üçün önbelleği təmizlə
log "📦 Paket önbelleği təmizlənir..."
sudo apt clean -y && sudo apt autoclean -y

# 2. Lazımsız paketləri sil
log "🗑️ İstifadə olunmayan paketlər silinir..."
sudo apt autoremove -y

# 3. Cache qovluqları sil
log "🧹 Cache faylları silinir..."
rm -rf ~/.cache/* /var/tmp/*

# 4. Sistem yenilənməsi
log "🔄 Sistem yenilənir..."
sudo apt update -y && sudo apt upgrade -y

# 5. Disk istifadəsini yoxla
log "💽 Disk istifadəsi:"
df -h | tee -a "$LOG_FILE"

log "✅ Təmizləmə prosesi bitdi."
echo ""
