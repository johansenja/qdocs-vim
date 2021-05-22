# Qdocs-vim

A vim wrapper around the [Qdocs](https://github.com/johansenja/qdocs) gem, providing access to a very lightweight language intelligence server for Ruby. It supports:

- Providing detailed information about instance and singleton methods for Ruby constants (eg. Classes and Modules)
- Querying a constant's instance and singleton methods by regular expression, returning the methods whose names match the given pattern
- Providing detailed information about active record attributes, if the constant being queried is an ActiveRecord model

## Installation

First install the qdocs gem

`$ gem install qdocs`

Then use your favourite plugin manager, eg.

```vim
Plug 'johansenja/qdocs-vim'
```

Then when you open a buffer that is recognised as Ruby, it will automatically start a qdocs server, ready for use (see below) 


## Usage

When you open up a recognised ruby file type, the qdocs server will start and you can query it like this:

`:Qd Set\#length` to find out about `Set`'s `length` instance method

`:Qd Set/len(gth)?/` to look up `Set`'s instance and singleton methods by regular expression

`:Qd Set.[]` to find out about `Set`'s `[]` singleton method

`:Qd User\#email` to find out about `User`'s `email` instance method (for active record classes)

Note, certain characters in Vim commands will have to be escaped, such as `#` and `%`

See [Qdocs](https://github.com/johansenja/qdocs) for further info

## License

MIT
