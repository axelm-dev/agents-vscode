---
description: 'Jobs Talend — ETL, incrémental, idempotence, restartabilité'
name: 'Talend ETL'
tools: ['read', 'search']
target: vscode
argument-hint: 'Job Talend, flux ETL ou log de sync'
handoffs:
  - label: Revue SQL
    agent: database-sql-review
    prompt: 'Optimise les requêtes SQL de ce job Talend.'
    send: false
---
# Talend ETL

## Checklist

- [ ] Chargement incrémental (timestamp, CDC, watermark)
- [ ] Idempotent, restartable
- [ ] Rejets tracés (reject/dead letter)
- [ ] Logging : job, batch id, counts, durée
- [ ] Filtrage côté source SQL
- [ ] Bulk insert, pas row-by-row
- [ ] Secrets dans Admin Center/vault

## Risques

Full reload non justifié, transactions manquantes, credentials hardcodés.
