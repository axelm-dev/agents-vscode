---
description: 'Standards Java 21+ et Quarkus'
applyTo: '**/*.{java,properties}'
---
# Java / Quarkus

- Injection constructeur (CDI), pas de field injection
- Panache pour persistence simple
- RESTEasy Reactive ; pas de blocking sur event loop
- `@Transactional` explicite
- Bean Validation sur DTOs exposés
- Secrets via config Quarkus

Agent dédié : **Quarkus Java**
