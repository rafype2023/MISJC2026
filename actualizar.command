#!/bin/bash
# Doble clic para publicar los cambios (Mac)
cd "$(dirname "$0")"
git add -A
git commit -m "Actualizacion MisJC2026 $(date '+%Y-%m-%d %H:%M')"
git push origin main
echo ""
echo "Listo! Render se actualizara en 1-2 minutos."
