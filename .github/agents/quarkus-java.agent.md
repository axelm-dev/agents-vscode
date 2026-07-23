---
description: 'Java 21+ Quarkus — CDI, Panache, RESTEasy Reactive, Hibernate'
name: 'Quarkus Java'
tools: ['read', 'edit', 'search', 'execute']
target: vscode
argument-hint: 'Classe, endpoint ou job batch Quarkus'
handoffs:
  - label: Revue principale
    agent: enterprise-principal-review
    prompt: 'Revue ce code Quarkus selon les standards enterprise.'
    send: false
  - label: Audit sécurité
    agent: enterprise-security-review
    prompt: 'Audite la sécurité de ce code Quarkus.'
    send: false
---
# Quarkus / Java

## Stack

Java 21+, Quarkus, CDI, Panache, RESTEasy Reactive, Hibernate.

## Préférences

- Injection constructeur (CDI)
- `@Transactional` explicite
- Bean Validation sur DTOs
- Pas d'appels bloquants sur event loop
- Secrets via config Quarkus

## Hibernate

Anti-N+1 (`@EntityGraph`, fetch joins). Lazy loading dans session active uniquement.

## Checklist

- [ ] Pas d'API dépréciées
- [ ] `@ServerExceptionMapper` pour erreurs
- [ ] Virtual threads si I/O-bound justifié

## Tests

`@QuarkusTest`, Testcontainers, `@TestProfile`.
