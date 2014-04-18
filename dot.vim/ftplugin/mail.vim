" checks the body of the mail, to see if we're talking about enclosures
" if so, prompts for a file to attach
" extremely useful when you're used to forget those

function! CheckAttach()
    let check='joint,attach,enclos,envoi'
    let oldPos=getpos('.')
    let ans=1
    let val = join(split(escape(check,' \.+*'), ','),'\|')
    1
    if search('\%('.val.'\)','W')
      let ans=input("Attach file (leave empty to abort): ", "", "file")
      while (ans != '')
              normal magg}-
              call append(line('.'), 'Attach: '.ans)
              redraw
          let ans=input("Attach another file: (leave empty to abbort): ", "", "file")
      endwhile
    endif
    exe ":write ". expand("<amatch>")
    call setpos('.', oldPos)
endfu

augroup script
    au!
    au BufWriteCmd,FileWriteCmd mutt* :call CheckAttach()
augroup END


