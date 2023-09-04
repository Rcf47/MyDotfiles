local ls = require("luasnip") --{{{
local snippet = ls.snippet
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep


ls.add_snippets("javascript", {
  snippet({ trig = "fa1", regTrig = true }, fmt(
    [[
  ({}) => {{
    {}
  }}
  ]],
    { i(1), i(2) })),
  snippet({ trig = "fa2", regTrig = true }, fmt("({}) => {}",
    { i(1), i(2) })),
}, {
  type = "autosnippets",
  key = "all_auto"
})
