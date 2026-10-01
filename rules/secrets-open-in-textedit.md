# Asking me for a key / secret

When I need to supply an API key, token, or other secret that goes in a file (`.env`,
`.env.local`, a config file, etc.), don't just tell me "paste it into X". Instead run,
with Bash `run_in_background: true`:

```
~/.claude/bin/wait-secret-file.sh <path to file> <VAR_NAME>
```

It adds an empty `VAR_NAME=` placeholder (without clobbering existing contents), opens
the file in TextEdit, and exits when I close that TextEdit window — printing `DONE` if
the value is filled or `EMPTY` if not. Tell me in one line which variable to fill in and
where to get the key, then continue automatically on the completion notification — don't
ask me to say when I'm done. Never print or read the secret back into context.
