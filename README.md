# BuzReps/buz-vcpkg

## Usage example:
Inside an empty directory add the following code into `vcpkg.json` and run `vcpkg install`.  
`sqliteai-liteparser` is expected to be built and installed in `vcpkg_installed`:

```json
{
  "$schema": "https://raw.githubusercontent.com/microsoft/vcpkg-tool/main/docs/vcpkg.schema.json",
  "name": "my-project",
  "version-string": "1.0.0",
  "dependencies": [
    "sqliteai-liteparser"
  ],
  "builtin-baseline": "6da16a9600492fbcb7713560d993ac76823290de",
  "configuration": {
    "registries": [
      {
        "kind": "git",
        "repository": "https://github.com/BuzReps/buz-vcpkg",
        "reference": "master",
        "baseline": "8d55d532d617b9a59a7f6107b79d7c8d8d329790",
        "packages": [
          "sqliteai-liteparser"
        ]
      }
    ]
  }
}
```

