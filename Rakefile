task :default do
  File.exist?('../.vimrc')  && File.delete('../.vimrc')
  File.exist?('../.gvimrc') && File.delete('../.gvimrc')
  File.rename('../dotvim', '../.vim')
  ln_s(Dir.pwd + '/vimrc', '../.vimrc')
  ln_s(Dir.pwd + '/gvimrc', '../.gvimrc')
  `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
end
