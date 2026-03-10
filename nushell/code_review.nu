# experimenting with AI code reviews

export def claude-review [rev?: string] {
  review claude $rev
}

export def amp-review [rev?: string] {
  review amp $rev
}

def review [tool: string, rev?: string] {
  let prompt_txt = prompt $rev
  ^$tool $prompt_txt
}

def prompt [rev?: string] {
  let diff_cmd_txt = diff_cmd $rev
  $"I need you to review code for me. Run the '($diff_cmd_txt)' to get the diff, analyze the changes, and list possible issues or improvements. Be thorough, I don't mind false positives that much."
}

def diff_cmd [rev?: string] {
  let from_flag = match $rev {
    null => ""
    _ => $"-f '($rev)' "
  }
  $"jj diff ($from_flag)--git --no-pager"
}

