---
name: task-to-knowledge
description: Extract learnings from completed tasks and create knowledge notes. Use when user says "make this knowledge", "extract learnings", "save what I learned", or wants to convert task insights to permanent notes.
---

# Task to Knowledge

Extracts learnings from completed tasks and creates permanent knowledge notes.

## When to Use

- Task is completed and has valuable insights
- User wants to save learnings for future reference
- Converting project experience to reusable knowledge

## Process

1. Read the completed task file
2. Identify key learnings, patterns, or insights
3. Create knowledge note in `Knowledge/`
4. Link back to source task
5. Suggest related knowledge notes
6. Move original task to `Archive/` (optional)

## Knowledge Note Template

```markdown
---
title: "Knowledge title"
type: knowledge
created: YYYY-MM-DD
source: [[task-filename]]
tags: [relevant, tags]
---

## Summary

Brief overview of the knowledge.

## Key Points

- Point 1
- Point 2
- Point 3

## Details

Detailed explanation if needed.

## Related

- [[related-knowledge-1]]
- [[related-knowledge-2]]
```

## Extraction Guidelines

### What to Extract

- **Patterns**: Reusable approaches or solutions
- **Decisions**: Why certain choices were made
- **Gotchas**: Problems encountered and how to avoid them
- **Best Practices**: Recommended ways of doing things
- **References**: Useful resources discovered

### How to Name Knowledge Files

- Use descriptive kebab-case names
- Focus on the concept, not the task
- Examples:
  - Task: "API認証実装" → Knowledge: `jwt-refresh-token-pattern.md`
  - Task: "チーム会議準備" → Knowledge: `effective-meeting-facilitation.md`

## Interactive Flow

1. Show task content summary
2. Ask: "What are the key learnings from this task?"
3. Suggest knowledge title based on content
4. Create draft knowledge note
5. Ask for confirmation/edits
6. Save to `Knowledge/`
7. Ask: "Move original task to Archive?"

## Linking

- Add `source: [[task-id]]` to knowledge frontmatter
- This preserves the connection to original context
- Enables tracing knowledge back to experience

## Output

After creating knowledge:

```
Created: Knowledge/jwt-refresh-token-pattern.md

Key points captured:
- JWTは短命トークン（15分）推奨
- リフレッシュトークンはHTTPOnlyクッキーに保存
- ローテーション戦略でセキュリティ向上

Source: [[task-api-auth-implementation]]

Related notes found:
- [[api-security-basics]]
- [[authentication-patterns]]

Move original task to Archive? (y/n)
```
