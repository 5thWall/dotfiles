if !exists(':Tabularize')
  finish " Give up here; the tabular plugin hasn't been loaded
endif

let s:save_cpo = &cpo
set cpo&vim

AddTabularPipeline! ruby_hash /\w:\zs/l0l1

let &cpo = s:save_cpo
unlet s:save_cpo
