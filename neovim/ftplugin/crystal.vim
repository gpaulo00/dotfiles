
" using crystalctags
let g:tagbar_type_crystal = {
    \'ctagstype': 'crystal',
    \'ctagsbin': 'crystalctags',
    \'kinds': [
        \'c:classes',
        \'m:modules',
        \'d:defs',
        \'x:macros',
        \'l:libs',
        \'s:sruct or unions',
        \'f:fun'
    \],
    \'sro': '.',
    \'kind2scope': {
        \'c': 'namespace',
        \'m': 'namespace',
        \'l': 'namespace',
        \'s': 'namespace'
    \},
\}
