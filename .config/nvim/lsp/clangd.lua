return {
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    root_markers = {
        'compile_commands.json', 'compile_flags.txt',
        '.clangd', '.clang-tidy', '.clang-format',
        'CMakeLists.txt', 'Makefile', '.git',
    },
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
    },
    settings = {
        clangd = {
            Style = "Google",
            UseTabs = "Never",
            IndentWidth = 4,
            BreakBeforeBraces = "Allman",
            AllowShortFunctionsOnASingleLine = "None",
            ColumnLimit = 80,
        },
    },
}
