## How to Use

`SwiftDispatchOnce` adds an extension on `DispatchQueue` for performing a closure only once.

You use it as follows:

```
DispatchQueue.once {
  // code to execute only once
}
```

This automatically generates a `token` based on the file name, method name and line number it's called from. If the `token` is found to have been used before, the closure is not executed.

Alternatively, you can provide your own `token` manually as follows:

```
DispatchQueue.once(token: "com.mydomain.uniqueName") {
  // code to execute only once
}
```

## Attribution

This library was created thanks to this StackOverflow post:

[https://stackoverflow.com/questions/37886994/dispatch-once-in-swift-3](https://stackoverflow.com/questions/37886994/dispatch-once-in-swift-3)

Thank you for posting, [David](https://stackoverflow.com/users/378698/david), [Tod Cunningham](https://stackoverflow.com/users/298571/tod-cunningham) and [VaporwareWolf](https://stackoverflow.com/users/803882/vaporwarewolf).

## License

`SwiftDispatchOnce` is available under the MIT license (see the LICENSE file for more details).
