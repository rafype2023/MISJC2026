#!/bin/bash
# Doble clic para publicar los cambios (Mac)
cd "$(dirname "$0")"

# Genera albumes.json con las fotos de cada carpeta en albumes/
{
  echo '{'
  primero_album=true
  for d in fotos/*/; do
    [ -d "$d" ] || continue
    nombre=$(basename "$d")
    if [ "$primero_album" = true ]; then primero_album=false; else echo ','; fi
    printf '  "%s": [' "$nombre"
    primera=true
    for f in "$d"*.jpg "$d"*.jpeg "$d"*.png "$d"*.webp "$d"*.gif "$d"*.JPG "$d"*.JPEG "$d"*.PNG; do
      [ -e "$f" ] || continue
      if [ "$primera" = true ]; then primera=false; else printf ','; fi
      printf '"%s"' "$(basename "$f")"
    done
    printf ']'
  done
  echo ''
  echo '}'
} > albumes.json
echo "albumes.json actualizado:"
cat albumes.json

git add -A
git commit -m "Actualizacion MisJC2026 $(date '+%Y-%m-%d %H:%M')"
git push origin main
echo ""
echo "Listo! Render se actualizara en 1-2 minutos."
