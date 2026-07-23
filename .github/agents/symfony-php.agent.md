---
description: 'Symfony 6/7, PHP 8.x — Doctrine, Messenger, Security, API Platform'
name: 'Symfony PHP'
tools: ['read', 'edit', 'search', 'execute']
target: vscode
argument-hint: 'Controller, entity ou service Symfony'
handoffs:
  - label: Revue principale
    agent: enterprise-principal-review
    prompt: 'Revue ce code Symfony/PHP.'
    send: false
---
# Symfony / PHP

## Stack

Symfony 6/7, PHP 8, Doctrine, Security, Validation, Messenger.

## Préférences

- Autowiring + injection constructeur
- Migrations Doctrine (jamais DDL manuel en prod)
- DQL paramétrée
- DTOs pour exposition externe
- Messenger pour async

## Sécurité

CSRF, voters authz, pas de features dépréciées.

## Tests

PHPUnit, WebTestCase, fixtures.
