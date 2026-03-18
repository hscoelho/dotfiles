- [ ] Change jujutsu nushell completion: https://www.jj-vcs.dev/latest/cli-reference/#jj-util-completion
- [ ] Follow this to refactor the theme: https://www.ditig.com/256-colors-cheat-sheet
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
- [ ] Sync obsidian in background instead of using app in linux
- [x] Create a "theme-creator.nu" script
    - Takes an input pallete.json and N .template files and creates theme files for my tools
    - Probably a good idea to make the templates as simple as possible and make them in .nu
    - e.g.: theme-colors.lua with local bg = "#FFFFFF" that is imported by the main theme.lua
