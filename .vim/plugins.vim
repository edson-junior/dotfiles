set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'othree/yajs.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-pug'
Plugin 'mxw/vim-jsx'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-markdown'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/jade.vim'
Plugin 'wavded/vim-stylus'
Plugin 'styled-components/vim-styled-components'
Plugin 'jparise/vim-graphql'
Plugin 'leafgarland/typescript-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

