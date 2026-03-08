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
| **Build Docker** | Construction d'une image Docker multi-stage regroupant le frontend et le backend. |
| **Deploy Vercel** | Déploiement automatique sur Vercel après réussite des tests et du build. |

## Configuration des Secrets GitHub

Pour que le déploiement automatique fonctionne, vous devez ajouter les secrets suivants dans les paramètres de votre dépôt GitHub (**Settings > Secrets and variables > Actions**) :

1. `VERCEL_TOKEN` : Votre jeton d'accès personnel Vercel.
2. `VERCEL_ORG_ID` : L'ID de votre organisation/équipe sur Vercel.
3. `VERCEL_PROJECT_ID` : L'ID de votre projet sur Vercel.

## Installation Locale

### Prérequis
- Node.js (v18+)
- Docker

### Backend
```bash
cd backend
npm install
npm start
```

### Frontend
```bash
cd frontend
npm install
npm start
```

### Docker Build & Run
```bash
# Build de l'image
docker build -t mon-app-fullstack .

# Lancement du conteneur
docker run -p 3000:3000 mon-app-fullstack
```
