# nvim-dark theme

evaluate-commands %sh{
    # gray="rgb:928374"
    # red="rgb:ffc0b9"
    # green="rgb:b4f6c0"
    # yellow="rgb:fce094"
    # blue="rgb:9fd8ff"
    # purple="rgb:d3869b"
    # aqua="rgb:83efef"
    # orange="rgb:fe8019"

    blue="rgb:9fd8ff"
    cyan="rgb:83efef"
    green="rgb:aaedb7"
    magenta="rgb:ffc3fa"
    red="rgb:ffbcb5"
    yellow="rgb:f4d88c"

    bg="rgb:14161B"
    bg_alpha="rgba:282828a0"
    bg1="rgb:3c3836"
    bg2="rgb:504945"
    bg3="rgb:665c54"
    bg4="rgb:7c6f64"

    fg="rgb:ebdbb2"
    fg_alpha="rgba:ebdbb2a0"
    fg0="rgb:fbf1c7"
    fg2="rgb:d5c4a1"
    fg3="rgb:bdae93"
    fg4="rgb:a89984"

    echo "
        # Code highlighting
        face global value         ${purple}
        face global type          ${yellow}
        face global variable      ${blue}
        face global module        ${green}
        face global function      ${blue}
        face global string        ${green}
        face global keyword       ${red}
        face global operator      ${fg}
        face global attribute     ${orange}
        face global comment       ${gray}+i
        face global documentation comment
        face global meta          ${aqua}
        face global builtin       ${fg}+b

        # Markdown highlighting
        # face global title     ${green}+b
        # face global header    ${orange}
        # face global mono      ${fg4}
        # face global block     ${aqua}
        # face global link      ${blue}+u
        # face global bullet    ${yellow}
        # face global list      ${fg}

        face global BufferPadding      ${bg2},${bg}
        face global Default            ${fg},${bg}
        face global DiagnosticError    ${red}
        face global DiagnosticWarning  ${yellow}
        face global Error              ${bg},${red}
        face global Information        ${bg},${fg}
        face global LineNumberCursor   ${yellow},${bg1}
        face global LineNumbers        ${bg4}
        face global LineNumbersWrapped ${bg1}
        face global MatchingChar       ${fg},${bg3}+b
        face global MenuBackground     ${fg},${bg2}
        face global MenuForeground     ${bg2},${blue}
        face global MenuInfo           ${bg}
        face global PrimaryCursor      ${bg},${fg}+fg
        face global PrimaryCursorEol   ${bg},${fg4}+fg
        face global PrimarySelection   ${fg_alpha},${blue}+g
        face global Prompt             ${yellow}
        face global SecondaryCursor    ${bg},${bg4}+fg
        face global SecondaryCursorEol ${bg},${bg2}+fg
        face global SecondarySelection ${bg_alpha},${blue}+g
        face global StatusCursor       ${bg},${fg}
        face global StatusLine         ${fg},${bg}
        face global StatusLineInfo     ${purple}
        face global StatusLineMode     ${yellow}+b
        face global StatusLineValue    ${red}
        face global Whitespace         ${bg2}+f
    "
}
