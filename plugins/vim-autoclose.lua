-- Auto close tag config
--  filenames like *.xml, *.html, *.xhtml, ...
--  These are the file extensions where this plugin is enabled.
--
-- vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.php"

--  filenames like *.xml, *.xhtml, ...
--  This will make the list of non-closing tags self-closing in the specified files.
--
-- vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx,*.tsx"

-- filetypes like xml, html, xhtml, ...
-- These are the file types where this plugin is enabled.

-- vim.g.closetag_filetypes = "html,xhtml,phtml,blade.html"

-- filetypes like xml, xhtml, ...
-- This will make the list of non-closing tags self-closing in the specified files.

-- vim.g.closetag_xhtml_filetypes = "xhtml,jsx"

-- integer value [0|1]
-- This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
--
-- vim.g.closetag_emptyTags_caseSensitive = 1

--
--  Shortcut for closing tags, default is '>'
--
-- vim.g.closetag_shortcut = ">"

-- integer value [0|1]
-- Enables closing tags for React fragments -> <></> for all supported file types
-- vim.g.closetag_enable_react_fragment = 1
return {}
