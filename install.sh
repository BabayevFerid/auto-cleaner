#!/bin/bash

CRON_JOB="0 3 * * * $(realpath auto_cleaner.sh)"

(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "✅ AutoCleaner hər gecə saat 03:00-da işə düşmək üçün cron-a əlavə edildi."
