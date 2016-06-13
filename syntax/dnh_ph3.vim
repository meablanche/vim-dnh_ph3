" Vim syntax file
" Language: Danmakufu ph3
" Author: Mea
" Latest Revision: 13 June 2016

" first setup some constants

" if current syntax has already been defined, then end script
if exists('b:current_syntax')
  finish
endif

" ----------------------------------------------
" Syntax
" ----------------------------------------------

" script headers and other preprocessor lines
"   the code that starts with '#'
syntax match dnh_header '^#.*$' contains=dnh_string,dnh_number,dnh_variable

" keywords
"   reserved keywords
syntax keyword dnh_reservedKeyword
      \ let
      \ break return yield 


"   conditional branching statements
syntax keyword dnh_conditional
      \ if else alternative case others
syntax keyword dnh_conditional
      \ if alternative case
      \ nextgroup=dnh_block_param
      \ skipwhite skipempty

"   boolean values
syntax keyword dnh_boolean
      \ true false

"   structures: subroutines, tasks, and functions
syntax keyword dnh_label_struct
      \ sub task function

"   local
syntax keyword dnh_local
      \ local


"   looping functions
syntax keyword dnh_looping
      \ loop while ascent descent

"   pre-defined enums
"   events {{{2
syntax keyword dnh_predefinedEvent
      \ EV_REQUEST_LIFE
      \ EV_REQUEST_TIMER
      \ EV_REQUEST_IS_LAST_SPELL
      \ EV_REQUEST_IS_DURABLE_SPELL
      \ EV_REQUEST_SPELL_SCORE
      \ EV_TIMEOUT
      \ EV_START_BOSS_SPELL
      \ EV_GAIN_SPELL
      \ EV_START_BOSS_STEP
      \ EV_END_BOSS_STEP
      \ EV_PLAYER_SHOOTDOWN
      \ EV_PLAYER_SPELL
      \ EV_PLAYER_REBIRTH
      \ EV_PAUSE_ENTER
      \ EV_PAUSE_LEAVE
      \ EV_REQUEST_SPELL
      \ EV_GRAZE
      \ EV_HIT
      \ EV_GET_ITEM
      \ EV_DELETE_SHOT_IMMEDIATE
      \ EV_DELETE_SHOT_TO_ITEM
      \ EV_DELETE_SHOT_FADE
      \ EV_USER_SYSTEM
      \ EV_USER_STAGE
      \ EV_USER_PLAYER
      \ EV_USER_PACKAGE
      \ EV_USER
"}}}2
"   pre-defined shot graphics {{{2
"     just the root, color next
let s:dnh_graphic_root=[
  \ 'DS_BALL_SS_',
  \ 'DS_BALL_S_',
  \ 'DS_BALL_BS_',
  \ 'DS_BALL_M_',
  \ 'DS_NEEDLE_',
  \ 'DS_RICE_S_',
  \ 'DS_ICE_',
  \ 'DS_MISSILE_',
  \ 'DS_RICE_M_',
  \ 'DS_KUNAI_',
  \ 'DS_SCALE_',
  \ 'DS_BILL_',
  \ 'DS_COIN_',
  \ 'DS_BUTTERFLY_',
  \ 'DS_LIGHT_',
  \ 'DS_STAR_S_',
  \ 'DS_STAR_M_',
  \ 'DS_KNIFE_YOUMU_',
  \ 'DS_KNIFE_KOUMA_',
  \ 'DS_BEAM_',
  \ 'DS_FIRE_',
  \ 'DS_BALL_L_' ]
"}}}2
"   pre-defined shot graphics, color {{{2
let s:dnh_graphic_color = [
  \ 'RED',
  \ 'ORANGE',
  \ 'YELLOW',
  \ 'GREEN',
  \ 'SKY',
  \ 'BLUE',
  \ 'PURPLE',
  \ 'WHITE' ]
"}}}2
" iterate over the above two lists and create a new keyword from each
for root in s:dnh_graphic_root
  for color in s:dnh_graphic_color
    " create a string that contains the 'syntax' statement to execute,
    "   with the concatenated root and color parts of the whole keyword
    "   into a keyword called dnh_predefinedGraphic
    let s:syntax = 'syntax keyword dnh_predefinedGraphic '.root.color
    exec s:syntax
  endfor
endfor



" pre-defined routines
"   @Initialize, @MainLoop, etc
syntax match dnh_predefinedRoutine '@[a-zA-Z0-9_]\+' "nextgroup=dnh_block_struct skipwhite


"   user-defined tasks and functions


" literals
"  a string is enclosed within single '' or double "" quotes
syntax match dnh_string '".*"'
"  a numeric value is just a number, sometimes a decimal
"   can be preceded by a sign (-/+), and contain a decimal point
syntax match dnh_number '\<\d\+\(\.\d\+\)\=\>'

" variables and function names
"   note, these must have priority over the above, or random specs of numbers
"     here and there in variable/function names will be highlighted!
"   a sub/task/function name will start with a letter or underscore, not a number
"syntax match dnh_name_struct '[a-zA-Z_]\+[a-zA-Z0-9_]*'
"syntax match dnh_name_variable '[a-zA-Z_]\+[a-zA-Z0-9_]*'


" comments
"   anything placed after a set of double forward-slashes '//' are comments and thus ignored
syntax match dnh_comment '//.*$'
"   inline comments are anything enclosed within '/* ... */'
syntax region dnh_block_inlineComment start='/\*' end='\*/'


" blocks of code
"   code structures, ie: subroutines, tasks and functions, are enclosed by curly braces '{...}'
syntax region dnh_block_struct start='{' end='}' fold transparent
"   lists are defined using square brackets '[ ... ]'
syntax region dnh_block_list start='\[' end='\]' fold transparent
"   arguments/parameters
syntax region dnh_block_param start='(' end=')' fold transparent




" ----------------------------------------------
" Highlighting {{{1
" ----------------------------------------------
let b:current_syntax = "dnh_ph3"

" headers
hi! def link dnh_header               PreProc

" reserved keywords
hi! def link dnh_reservedKeyword      Keyword
hi! def link dnh_conditional          Conditional
hi! def link dnh_boolean              Boolean
hi! def link dnh_looping              Repeat
hi! def link dnh_local                Label
hi! def link dnh_label_struct         Structure

" pre-defined enums
hi! def link dnh_predefinedEvent      Constant
hi! def link dnh_predefinedGraphic    Constant


" pre-defined routines
hi! def link dnh_predefinedRoutine    Label

" user-defined tasks, functions, and subroutines

" literals
hi! def link dnh_string               String
hi! def link dnh_number               Number

" identifiers, of variables and subs/tasks/functions
"hi! def link dnh_name_struct          Ignore
"hi! def link dnh_name_variable        Ignore

" comments
hi! def link dnh_comment              Comment
hi! def link dnh_block_inlineComment  Comment

" blocks of code


"}}}1
