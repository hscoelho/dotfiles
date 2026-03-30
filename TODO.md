- [ ] Ć
- [ ] Sync obsidian in background instead of using app in linux
- [x] Change jujutsu nushell completion: https://www.jj-vcs.dev/latest/cli-reference/#jj-util-completion
- [ ] Theme improvements
    - [ ] kitty: gray terminal color is hard to read in terminal
    - [ ] nvim: Add color to decorators (blue)
    - [ ] nvim: Add color to the breakpoint decorators (red when set, gray when not set)
    - [ ] nvim: Add color to html tags
    - [ ] nvim: Change color from gitsigns (added/modified: navy -> green (if possible, make added and modified different))
- [ ] Create a "theme.nu" nushell script
    - Sets theme or toggle dark and light mode
    - Should be "installable"(put into path) in a binaries folder with a command in install.nu
- [ ] Install amp, claude, gemini, qwen, etc. in mise with a specific node version
    - Gemini mise config.toml recommendation: 
    ```toml
        [alias.node]
        # This locks the name "node_dev_tools" to a specific, 
        # never-changing version string.
        node_dev_tools = "22.14.0"

        [tools]
        # This ensures that this specific version is 
        # always installed on your system.
        node = ["node_dev_tools", "latest"]

        # Optional: If you want to install npm packages 
        # directly via mise (even cleaner!)
        "npm:@qwen/code-cli" = { version = "latest", depends_on = ["node@22.14.0"] }
    ```
