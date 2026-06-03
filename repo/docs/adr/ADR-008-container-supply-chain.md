## Décision ajustée

Azure Container Registry n’étant pas disponible dans l’abonnement Azure for Students utilisé pour ce lab, le registre retenu est GitHub Container Registry.

Les images Docker et les charts Helm OCI seront publiés dans GHCR.

Cette décision permet de continuer la chaîne CI/CD sans dépendre d’un service Azure bloqué par quota, région ou limitation d’offre.

# ADR-008 - Container Supply Chain

## Statut
Accepté

## Contexte

Le projet nécessite une chaîne applicative conteneurisée proche d’un environnement professionnel : tests, build Docker, scan sécurité, push image et packaging Helm.

Azure Container Registry était initialement prévu, mais l’abonnement Azure for Students utilisé dans ce lab ne permet pas d’utiliser ACR dans les conditions actuelles.

## Décision

Le registre retenu pour le lab est GitHub Container Registry.

L’application sera développée en Python avec FastAPI et un worker séparé.

Les images Docker seront stockées dans GHCR.

Les charts Helm seront stockés dans GHCR comme artefacts OCI.

GitHub Actions sera utilisé pour exécuter les tests, construire l’image, scanner l’image et pousser l’image et le chart.

## Sécurité

- Publication GHCR via GitHub Actions avec `GITHUB_TOKEN`.
- Aucun token Docker Hub.
- Aucun client secret Azure pour cette pipeline.
- Image exécutée avec un utilisateur non-root.
- Scan Trivy dans la pipeline.
- Tags d’image basés sur le commit SHA.
- Possibilité de garder le package privé et d’utiliser un `imagePullSecret` Kubernetes plus tard.

## Contraintes

Le déploiement AKS sera fait dans une journée séparée.

Si GHCR reste privé, AKS devra utiliser un `imagePullSecret`.

Si le lab doit rester simple, l’image pourra être rendue publique temporairement.