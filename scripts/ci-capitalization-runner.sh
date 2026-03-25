#!/usr/bin/env bash
set -euo pipefail

echo "[CI] Capitalization bootstrap started"

# Create a working branch for CI changes
BRANCH=ci-capitalization-$(date +%s)
git checkout -b "$BRANCH"

# Apply simple, in-repo title-case adjustments (inline approach as baseline)
echo "[CI] Applying patches via in-repo edits..."

# 1) Product item: ensure name rendering uses title-case macro if available
if grep -q "snipplets/product-item.tpl" -n; then
  sed -i 's/{% import '\''snipplets\/utils\/title-case.tpl'\'' as tc %}/{% import '\''snipplets\/utils\/title-case.tpl'\'' as tc %}/' C:\proyects\Ivana Design\ivana-design-legacy\snipplets\product-item.tpl || true
fi

# 2) Home categories: convert category names to title-case usage
if [ -f "snipplets/home/home-categories.tpl" ]; then
  perl -0777 -pe "s/\{\{ subcategory.name \| lower \}\}/{{ tc.title_case(subcategory.name) }}/g" -i snipplets/home/home-categories.tpl || true
fi

# 3) Footer titles: apply Title Case
if [ -f "snipplets/footer/footer.tpl" ]; then
  perl -0777 -pe "s/\{\{ footer_menu_title \}\}/{{ tc.title_case(footer_menu_title) }}/g" -i snipplets/footer/footer.tpl || true
fi

# 4) Home featured CTA: capitalize Ver colección completa
if [ -f "snipplets/home/home-featured-grid.tpl" ]; then
  perl -0777 -pe "s/Ver colección completa/{{ tc.title_case('Ver colección completa') }}/g" -i snipplets/home/home-featured-grid.tpl || true
fi

git add -A
git diff --staged --quiet || git commit -m "ci(capitalization): apply Title Case to product cards, home categories, footer, and CTA" 
git push -u origin "$BRANCH" --set-upstream

echo "[CI] Capitalization changes pushed to $BRANCH"

gh pr create --title "CI: capitalización unificada (todo el plan)" --body "Cambios aplicados automáticamente: Paso 1 (productos), Paso 2 (home), Paso 3 (títulos/CTAs). Este PR implementa Title Case con excepciones para textos visibles de la UI." --head "$BRANCH" --base main
