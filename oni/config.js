//
// Gustavo Paulo <gustavo.paulo.segura@gmail.com>
// oni configuration
//
// https://github.com/onivim/oni/wiki/Configuration

const activate = oni => {
    console.log("config activated")
}

const deactivate = () => {
    console.log("config deactivated")
}

module.exports = {
    activate,
    deactivate,
    "oni.loadInitVim": true,
    "autoClosingPairs.enabled": true,
    "editor.fontFamily": "Knack Nerd Font",
    "editor.fontSize": "14px",
    "ui.colorscheme": "badwolf",
    "ui.animations.enabled": true,

    "tabs.mode": "native",
    "oni.hideMenu": true,
    "oni.useDefaultConfig": false,
    "sidebar.enabled": false,
    "statusbar.enabled": false,
}

