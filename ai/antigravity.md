### go to specific iteraction
agy --conversation=678c4a39-49f9-4e1f-bb34-934dd069648d

### Start antigravity
cd some_folder
agy

# send a prompt and exit
# --print-timeout (default 5 minutes)
agy -p "review the diff"

# Send a prompt and go into TUI antigravity
agy -i "review the diff"


## models

### list available models
agy models

### start with model
agy --model=<model_name>

### change model
/model

## change permissions
/permissions


## execution mode
https://antigravity.google/docs/cli/modes

shift-tab

/config 
- Agent Mode

agy --mode=accept-edits
agy --mode=plan
agy --mode=auto


# interactive settings panel
/config

# settings file
.gemini/antigravity-cli/settings.json

# show usage
/context

# list created artifacts
/artifact

# Metion a file in the prompt - use @
summarize the @file_name into 3 bullet points

# logout from antigravity-cli
/logout

# togglo see what the ai is doing
ctrl-o

# emmit another prompt while ia is processing
# by the way
/btw

# planning mode
/plan

### run into a sandbox
agy --sandbox

### agent manager
/agents
    alt-j   go to agent waiting
    ctrl-k  aprove pending agent
    esc  leave pending

### task manager - agent history
/tasks
