# cocoapods-protected-dependencies

Protect your project from using depenencies from undesired sources (Dependency Confusion).

## Installation

1. Add to your `Gemfile`

    ``` bash
    gem 'cocoapods-protected-dependencies'
    ```

2. Add to `Podfile`

    ``` bash
    plugin 'cocoapods-protected-dependencies'
    ```

3. Run 
    ``` bash
    bundle install
    ```

## Update

Run
``` bash
bundle update cocoapods-protected-dependencies
```

## Usage

This plugin hooks the depenency resolver, this ways `pod install`, `pod update`, `pod lib lint` are all protected from using incorrect sources, no special command is needed.

The only requirement is creating a configuration file `protected-specs.yml`

## Configuration File Format

The configuration is an array of sources which contain a `name` attribute, `source` and a `regex` or an array of strings.

Example with regular expression:
``` yml
- name: 'My Source'
  source: git@github.com:itaybre/my_repo_specs.git
  regex: (IT|UY)*
```
This will allow any dependency from `my_repo_specs` that start with IT or UY.

Example with array of dependencies:
``` yml
- name: 'My Source'
  source: git@github.com:itaybre/my_repo_specs.git
  libs: 
    - ITDemoProject
    - UYVulnerable
```
This configuration will only allow the dependencies `ITDemoProject` and `UYVulnerable`.