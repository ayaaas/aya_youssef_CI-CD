
# CI/CD Pipeline Project

Ce projet contient une application fullstack avec un backend Node.js/Express et un frontend React.

## Structure du Projet
- `backend/` : Serveur Node.js
- `frontend/` : Application React

## Pipeline CI/CD

Le pipeline est configuré via GitHub Actions (`.github/workflows/ci-cd.yml`) et effectue les étapes suivantes :

| Étape | Description |
|-------|-------------|
| **Test Backend** | Installation des dépendances et exécution des tests unitaires du backend. |
| **Test Frontend** | Installation des dépendances et exécution des tests unitaires du frontend. |
| **Build Docker** | Construction d'une image Docker regroupant le frontend et le backend. |
| **Deploy Vercel** | Déploiement automatique sur Vercel après réussite des tests et du build. |

## Configuration des Secrets GitHub

Pour que le déploiement automatique fonctionne, vous devez ajouter les secrets suivants dans les paramètres de votre dépôt GitHub (**Settings > Secrets and variables > Actions**) :

1. `VERCEL_TOKEN` : Votre jeton d'accès personnel Vercel.
2. `VERCEL_ORG_ID` : L'ID de votre organisation/équipe sur Vercel.
3. `VERCEL_PROJECT_ID` : L'ID de votre projet sur Vercel.

Ces informations peuvent être récupérées après avoir exécuté la commande `vercel` qui crée un dossier `.vercel` contenant ces identifiants.

## Installation Locale

### Prérequis
- Node.js (v18+)
- Docker
- Vercel CLI

### Backend
```bash
cd backend
npm install
npm start
````

### Frontend

```bash
cd frontend
npm install
npm start
```

## Docker Build & Run

```bash
# Build de l'image Docker
docker build -t mon-app-cicd .

# Lancement du conteneur
docker run -p 3000:3000 mon-app-cicd
```

L'application sera accessible sur :

```
http://localhost:3000
```

## Installation de Vercel CLI

Pour pouvoir lier votre projet à Vercel :

```bash
npm install -g vercel
```

Puis initialiser le projet :

```bash
vercel
```

Cette commande crée un dossier `.vercel` contenant les informations nécessaires pour le déploiement.

## Déploiement Automatique

Après la configuration du pipeline CI/CD et des secrets GitHub, chaque modification poussée sur la branche **main** déclenche automatiquement :

1. Les tests backend
2. Les tests frontend
3. La construction de l'image Docker
4. Le déploiement sur Vercel

### Commandes utilisées pour déclencher le pipeline

Après chaque modification :

```bash
git add .
git commit --allow-empty -m "update"
git push origin main
```

Le pipeline GitHub Actions s'exécutera automatiquement et déploiera la nouvelle version de l'application.

