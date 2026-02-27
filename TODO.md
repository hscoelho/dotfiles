- [ ] Create a "theme.nu" nushell script
    - Sets theme or toggle dark and light mode
    - Should be "installed" in a binaries folder
- [ ] Install gemini and qwen and whatever other agent in mise with a specific node version
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

