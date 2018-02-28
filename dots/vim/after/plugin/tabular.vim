if !exists(':Tabularize')
  finish " Give up here; the tabular plugin hasn't been loaded
endif

let s:save_cpo = &cpoptions
set cpoptions&vim

AddTabularPattern ruby_hash /\w:\zs/l0l1

let &cpoptions = s:save_cpo
unlet s:save_cpo
