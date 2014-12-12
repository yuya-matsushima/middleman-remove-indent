# middleman-remove-indent

[![Gem Version](https://badge.fury.io/rb/middleman-remove-indent.svg)](http://badge.fury.io/rb/middleman-remove-indent)
[![Build Status](https://travis-ci.org/yterajima/middleman-remove-indent.svg?branch=master)](https://travis-ci.org/yterajima/middleman-remove-indent)

`middleman-remove-indent` は [Middleman](http://middlemanapp.com/) の拡張機能です。  
この拡張機能は build したファイル (例: .html, .css) からインデントを削除します。

## インストール 

Gemfile に次の行を追加してください:

    gem 'middleman-remove-indent'

コマンドを実行します:

    $ bundle

Gemfile を使わずにインストールする場合は次のコマンドを実行してください:

    $ gem install middleman-remove-indent

## 使い方

`config.rb` に記述します:

```ruby
configure :build do
  activate :remove_indent
end
```

この場合, `middleman-remove-indent` は `build/*.html` と `build/*.css` に該当するファイルからインデントを削除します。  
`*.html` ファイルのみインデントを削除したい場合には, `:exts` オプションを変更します:

```ruby
configure :build do
  activate :remove_indent, :exts => %w(.html) # default:  %w(.html .css)
end
```

さらに, `build` 後のファイルから空行を削除したい場合, `:remove_blank_line` オプションを利用できます:

```ruby
configure :build do
  activate :remove_indent, :remove_blank_line => true # default: false
end
```

## Contributing

1. Fork it ( http://github.com/yterajima/middleman-remove-indent/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

