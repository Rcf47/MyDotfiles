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

local snippets, autosnippets = {}, {} --}}}

local arrowFunctionWithBrackets = snippet({ trig = "fa1", regTrig = true }, fmt(
  [[
  ({}) => {{
    {}
  }}
  ]],
  { i(1), i(2) }))

local arrowFunctionWithoutBrackets = snippet(
  { trig = "fa2", regTrig = true },
  fmt("({}) => {}", { i(1), i(2) })
)


table.insert(autosnippets, arrowFunctionWithBrackets)
table.insert(autosnippets, arrowFunctionWithoutBrackets)

return snippets, autosnippets
