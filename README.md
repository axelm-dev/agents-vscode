# VS Code Copilot — Agents & Instructions

Dossier portable à intégrer sur le PC pro (VS Code 1.106+ avec GitHub Copilot).

## Structure

```
vscode-copilot/
├── install.ps1                 ← script de déploiement Windows
├── README.md
├── .github/
│   ├── copilot-instructions.md
│   ├── agents/                 ← 7 custom agents
│   └── instructions/           ← instructions par type de fichier
└── .vscode/
    ├── extensions.json         ← extensions recommandées
    ├── mcp.json                ← serveurs MCP (GitHub, Playwright)
    └── settings.json           ← agents activés
```

## Déploiement rapide (Windows)

```powershell
cd e:\projet\vscode-copilot
.\install.ps1 -TargetPath "C:\chemin\vers\mon-projet"
```

Ou copie manuelle de `.github/` et `.vscode/` à la racine du projet.

### Option agents utilisateur (tous projets)

```powershell
New-Item -ItemType Directory -Path "$env:USERPROFILE\.copilot\agents" -Force
Copy-Item ".github\agents\*" "$env:USERPROFILE\.copilot\agents\" -Force

New-Item -ItemType Directory -Path "$env:USERPROFILE\.copilot\instructions" -Force
Copy-Item ".github\instructions\*" "$env:USERPROFILE\.copilot\instructions\" -Force
```

## Extensions recommandées

VS Code propose l'installation via la popup **Install Recommended Extensions** au premier ouverture.

Installation CLI :

```powershell
$exts = @(
  "GitHub.copilot",
  "GitHub.copilot-chat",
  "vscjava.vscode-java-pack",
  "redhat.vscode-quarkus",
  "bmewburn.vscode-intelephense-client",
  "redhat.vscode-yaml",
  "ms-azuretools.vscode-docker",
  "GitHub.vscode-pull-request-github"
)
foreach ($ext in $exts) { code --install-extension $ext }
```

| Extension | ID | Rôle |
|-----------|-----|------|
| GitHub Copilot | `GitHub.copilot` | IA inline (obligatoire) |
| GitHub Copilot Chat | `GitHub.copilot-chat` | Chat + agents (obligatoire) |
| Extension Pack for Java | `vscjava.vscode-java-pack` | Java 21, Maven/Gradle |
| Quarkus | `redhat.vscode-quarkus` | Projets Quarkus |
| PHP Intelephense | `bmewburn.vscode-intelephense-client` | Symfony/PHP |
| YAML | `redhat.vscode-yaml` | Config, CI, K8s |
| Docker | `ms-azuretools.vscode-docker` | Conteneurs |
| GitHub Pull Requests | `GitHub.vscode-pull-request-github` | PR dans VS Code |

Voir `.vscode/extensions.json` pour la liste complète.

## MCP (Model Context Protocol)

Fichier `.vscode/mcp.json` :

| Serveur | Prérequis | Usage agent |
|---------|-----------|-------------|
| **github** | VS Code 1.101+, auth OAuth GitHub | PR, issues, repos, code search |
| **playwright** | Node.js + npx | Tests web, navigation, screenshots |

### Activation MCP

1. Command Palette → `MCP: List Servers`
2. Démarrer **github** → authentification OAuth si demandé
3. Démarrer **playwright** (nécessite Node.js installé)
4. Dans le chat Agent → **Select Tools** → vérifier que les outils MCP apparaissent

### MCP optionnels (à ajouter manuellement)

Rechercher `@mcp` dans Extensions ou `MCP: Add Server` :

- PostgreSQL / SQL Server — requêtes et schéma BDD
- Azure — si infra cloud

Exemple PAT GitHub (si OAuth bloqué par l'IT) — remplacer la config `github` :

```json
{
  "servers": {
    "github": {
      "type": "http",
      "url": "https://api.githubcopilot.com/mcp/",
      "headers": {
        "Authorization": "Bearer ${input:github_mcp_pat}"
      }
    }
  },
  "inputs": [
    {
      "type": "promptString",
      "id": "github_mcp_pat",
      "description": "GitHub Personal Access Token",
      "password": true
    }
  ]
}
```

## Utilisation des agents

1. Ouvrir **Chat Copilot** (Ctrl+Alt+I)
2. Mode **Agent**
3. Menu **Agents** → *Enterprise Principal Review*, *Quarkus Java*, etc.
4. Handoffs disponibles après chaque réponse (ex. Revue → Audit sécurité)

## Agents disponibles

| Fichier | Rôle |
|---------|------|
| `enterprise-principal-review.agent.md` | Revue code/architecture |
| `enterprise-security-review.agent.md` | Audit OWASP, auth |
| `quarkus-java.agent.md` | Java 21+, Quarkus |
| `symfony-php.agent.md` | Symfony 6/7, PHP 8 |
| `talend-etl.agent.md` | Jobs Talend, ETL |
| `database-sql-review.agent.md` | Optimisation SQL |
| `api-integration-review.agent.md` | REST/SOAP/OAuth, SaaS |

## Instructions automatiques

| Fichier | Activation |
|---------|------------|
| `copilot-instructions.md` | Toujours (projet) |
| `instructions/java-quarkus.instructions.md` | Fichiers `.java` |
| `instructions/symfony-php.instructions.md` | Fichiers `.php`, `.yaml` |
| `instructions/talend-etl.instructions.md` | Dossiers Talend |
| `instructions/sql-databases.instructions.md` | Fichiers `.sql` |
| `instructions/security.instructions.md` | Code backend |

## Prérequis PC pro

- VS Code 1.106+
- Abonnement GitHub Copilot (ou plan Free)
- Node.js (pour MCP Playwright)
- Extensions autorisées par l'IT (vérifier whitelist)

## Références

- [Custom agents](https://code.visualstudio.com/docs/copilot/customization/custom-agents)
- [Custom instructions](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)
- [MCP servers](https://code.visualstudio.com/docs/copilot/customization/mcp-servers)
