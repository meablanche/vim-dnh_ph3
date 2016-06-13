" ftdetect/dnh_ph3.vim

" this file lets vim detect Danmakufu ph3 script files
" note: all danmakufu script files must start with either:
"   #TouhouDanmakufu... or #... in the first line!

" first check if the filetype autocommand has been triggered yet
if did_filetype()
  finish
endif

" see if txt file is a danmakufu script file
augroup dnhdetect
  au! BufRead,BufNewFile *.txt call DetectDNH_PH3()
augroup END

" note, remember to only call when checking txt files
function! DetectDNH_PH3()
" check the first line for the danmakufu script header line
  if getline(1) =~ '^#TouhouDanmakufu.*' || '^#東方弾幕風'
    " next check if this is a dnh ph3 version file
    if getline(2) =~ '^#ScriptVersion\[3\].*$'
      " if both checks pass, then set the filetype to dnh_ph3
      "   note: as danmakufu files generally end in .txt, we must override the filetype by explicitly setting it
      set filetype=dnh_ph3
    endif
  endif
endfunction
