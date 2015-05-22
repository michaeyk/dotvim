task :default do
  File.exist?('../.vimrc')  && File.delete('../.vimrc')
  File.exist?('../.gvimrc') && File.delete('../.gvimrc')
  File.rename('../dotvim', '../.vim')
  `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
end
