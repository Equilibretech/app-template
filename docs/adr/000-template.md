# ADR-000: Decision Record Template

**Status:** Template  
**Date:** YYYY-MM-DD  
**Deciders:** [Liste des personnes impliquées]  
**Tags:** [template, process]

## Context

Ce template suit le format MADR (Markdown Architecture Decision Records) v1.2.0 pour documenter les décisions architecturales importantes.

Chaque ADR doit capturer :
- Le contexte de la décision
- Les options considérées  
- La décision prise et les raisons
- Les conséquences attendues

## Decision Drivers

- Traçabilité des décisions techniques
- Faciliter l'onboarding des nouveaux développeurs
- Documenter les compromis et trade-offs
- Base pour les revues d'architecture

## Considered Options

1. **Format libre** - Documentation non structurée
2. **MADR** - Markdown Architecture Decision Records  
3. **ADR Tools** - Outils spécialisés pour ADR

## Decision Outcome

Choix de **MADR** car :
- Format simple et lisible
- Intégration facile avec Git
- Pas de dépendance externe
- Standard largement adopté

### Positive Consequences

- Documentation centralisée des décisions
- Meilleure traçabilité historique
- Format standardisé et consistent
- Facilite les discussions architecturales

### Negative Consequences

- Effort initial pour adopter le processus
- Maintenance requise pour tenir à jour

## Links

- [MADR](https://adr.github.io/madr/) - Format de référence
- [ADR Templates](https://adr.github.io/adr-templates/) - Autres templates disponibles

---

## Instructions pour utiliser ce template

1. Copier ce fichier en `00X-nom-decision.md`
2. Remplacer les sections par le contenu de votre décision
3. Mettre le status à "Proposed" pendant la discussion
4. Passer à "Accepted" une fois la décision validée
5. Utiliser "Deprecated" ou "Superseded" si remplacé

### Exemple de numérotation
- `001-choice-of-programming-language.md`
- `002-database-selection.md`  
- `003-deployment-strategy.md`