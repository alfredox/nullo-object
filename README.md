# Nullo-Object

This is a fork from [this repo](https://github.com/alfredox/nullo-object)

## Usage:

Just require the gem with `require 'nullo-object'` and then:  

`object.nullo.method.calls.if_nil(0)` should return whatever `object.method.calls` returns.
but if something is nil along the way, instead of blowing up and throwing a `NoMethodError` it returns the argumen to the `if_nil` method.
in this case the answer is `0`.
