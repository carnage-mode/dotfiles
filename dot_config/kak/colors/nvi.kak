# code

evaluate-commands %sh{
    blue="rgb:a6dbff"
    cyan="rgb:8cf8f7"
    green="rgb:b4f6c0"
    magenta="rgb:ffcaff"
    red="rgb:ffc0b9"
    yellow="rgb:fce094"

    gray1="rgb:eef1f8"
    gray2="rgb:e0e2ea"
    gray3="rgb:c4c6cd"
    gray4="rgb:9b9ea4"

    dark_gray4="rgb:4f5258"
    dark_gray3="rgb:2c2e33"
    dark_gray2="rgb:14161b"
    dark_gray1="rgb:07080d"

    bg=$dark_gray2
    fg=$gray2

    echo "
        face global Default ${fg},${fg}

        face global value         default
        face global type          ${cyan}
        face global variable      default
        face global module        ${green}
        face global function      ${cyan}
        face global string        ${green}
        face global keyword       default+b
        face global operator      default
        face global attribute     ${cyan}
        face global comment       ${gray4}+i
        face global documentation comment
        face global meta          default+b
        face global builtin       default+b

        face global title default+b
        face global header default
        face global bold default+b
        face global italic default+i
        face global mono documentation
        face global block documentation
        face global link ${cyan}
        face global bullet ${cyan}
        face global list ${cyan}

        face global BufferPadding ${gray4}
        face global Default rgb:e1e3ea,rgb:14151a
        face global DiagnosticError    ${red}
        face global DiagnosticWarning  ${yellow}
        face global Error ${red}
        face global Information ${gray3},${dark_gray3}
        face global LineNumberCursor ${fg}+b
        face global LineNumbers ${gray4}
        face global LineNumbersWrapped ${dark_gray4}
        face global MatchingChar default,${dark_gray4}+b
        face global MenuBackground ${gray3},${dark_gray3}
        face global MenuForeground ${bg},${fg}
        face global MenuInfo ${red}
        face global PrimaryCursor ${bg},${fg}
        face global PrimaryCursorEol PrimaryCursor
        face global PrimarySelection default,${dark_gray4}+g
        face global Prompt ${cyan}
        face global Search ${green}
        face global SecondaryCursor ${gray3},${dark_gray3}
        face global SecondaryCursorEol ${gray3},${dark_gray3}
        face global SecondarySelection default,${dark_gray3}+g
        face global StatusCursor ${bg},${fg}
        face global StatusLine ${gray3},${dark_gray3}
        face global StatusLineInfo ${red}
        face global StatusLineMode ${yellow}
        face global StatusLineValue ${green}
        face global Whitespace ${dark_gray4}+f
        face global crosshairs_line default,${dark_gray3}
    "
}
