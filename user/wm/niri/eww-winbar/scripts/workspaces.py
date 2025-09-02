#!/usr/bin/env python3
import sys, json

ICON_MAP = {
    1: "",   # Thunderbird
    2: "",   # Browser
    3: "",   # Terminal
    4: "󰙯",   # Chat
    5: "",   # KeePass
    6: "",   # Games
    7: "",   # OBS/Helvum
}
DEFAULT_ICON = ""

def icon_for(ws):
    return ICON_MAP.get(ws["idx"], DEFAULT_ICON)

def render(workspaces):
    parts = []
    for ws in sorted(workspaces, key=lambda w: w["idx"]):
        if ws.get("is_active"):
            cls = "focused"
        elif ws.get("is_urgent"):
            cls = "urgent"
        else:
            cls = "empty"

        idx = ws["idx"]
        icon = icon_for(ws)
        parts.append(
            f'(button :class "{cls}" :vexpand true :onclick "niri msg action focus-workspace {idx}" (label :text "{icon}"))'
        )

    return f'(box :class "workspaces" :orientation "h" :space-evenly true :vexpand true :halign "center" {" ".join(parts)})'

workspaces = []

for line in sys.stdin:
    try:
        event = json.loads(line)
    except json.JSONDecodeError:
        continue

    if "WorkspacesChanged" in event:
        workspaces = event["WorkspacesChanged"]["workspaces"]

    elif "WorkspaceActivated" in event:
        active_id = event["WorkspaceActivated"]["id"]
        for ws in workspaces:
            ws["is_active"] = (ws["id"] == active_id)

    else:
        continue

    print(render(workspaces), flush=True)

