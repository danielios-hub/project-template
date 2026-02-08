# Skills in Captain's Log

**Skills** are specialized instruction sets that help Antigravity understand complex domain logic, architectures, or workflows specific to this project.

## Structure of a Skill

Each skill is a directory inside `.antigravity/skills/` with a mandatory `SKILL.md` file.

```text
.antigravity/skills/
└── [SkillName]/
    ├── SKILL.md         <-- Mandatory: Instructions and YAML frontmatter
    ├── scripts/         <-- Optional: Helper scripts
    └── examples/        <-- Optional: Reference implementations
```

### SKILL.md Format

The `SKILL.md` file must start with YAML frontmatter:

```markdown
---
name: Skill Name
description: Brief description of what this skill helps with.
---

# Instructions
Detailed steps on how to handle specific tasks related to this skill.
```

## How to use a Skill

When Antigravity encounters a task related to a skill, it will read the `SKILL.md` file and follow the instructions provided therein. You can also explicitly point Antigravity to a skill if you feel it's relevant.
