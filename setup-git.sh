#!/bin/bash
# ─────────────────────────────────────────────────────────────────────────
# S.T.E.A.M. Clicker — Script de setup Git initial
# Usage : bash setup-git.sh <URL_REMOTE>
# Exemple : bash setup-git.sh git@github.com:user/steam-clicker.git
# ─────────────────────────────────────────────────────────────────────────
set -e

REMOTE="${1:-}"
BRANCH="main"

echo "⚙  Initialisation du dépôt Git..."
git init
git checkout -b $BRANCH 2>/dev/null || git checkout $BRANCH

echo "📄  Staging des fichiers..."
git add .

echo "✅  Premier commit..."
git commit -m "feat: S.T.E.A.M. Clicker — version initiale standalone"

if [ -n "$REMOTE" ]; then
  echo "🔗  Ajout du remote origin : $REMOTE"
  git remote add origin "$REMOTE" 2>/dev/null || git remote set-url origin "$REMOTE"
  echo "🚀  Push vers $BRANCH..."
  git push -u origin $BRANCH
  echo "✅  Push terminé !"
else
  echo ""
  echo "⚠️  Aucun remote fourni."
  echo "    Pour pousser plus tard :"
  echo "    git remote add origin <URL>"
  echo "    git push -u origin main"
fi
