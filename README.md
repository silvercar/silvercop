# Overview

This gem houses RuboCop configuration files to be included in Silvercar Ruby projects.

# Branching Strategy

This repository uses [GitHub flow](https://guides.github.com/introduction/flow/).

* Feature branches should be Pull Requests opened against master.
* Feature branches should begin with the JIRA ticket number

# Pull Requests
All code merged into master must be merged via a pull request.

Pull requests must:

* Have one or more reviewers
* Be approved by one or more reviewers

Pull requests should:

* Be small, less than 2 days of work
* Be merged by author after review process

## Usage

Add to gemfile:

```gem 'silvercop'```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install silvercop

## Publishing changes
After merging your changes to master, create a tag in the github repo. This will trigger a CircleCi build
which will push the gem to RubyGems.

**Note**: Make sure you update the `Silvercop::VERSION`, otherwise the build will fail saying the package already
exists.

## Usage

RuboCop uses yml files to describe configuration. To begin using this with default configuration,
create a `.rubocop.yml` file in the root of your project with the following contents:

```ruby
inherit_gem:
  silvercop: .rubocop.yml
```

It is recommended to use this gem as `bundle exec rubocop -RD`, the two options being to run
Rails cops as well as output the cop in question for that line of code.

If many offenses are detected, it is recommended to generate a TODO list that can be handled over
time without needing to fix all of the existing offenses. This can be done by generating and
including the following config:

`bundle exec rubocop -RD --auto-gen-config`

Then add `inherit_from: .rubocop_todo.yml` to your `.rubocop.yml` file. Adding `--exclude-limit 10000` can help prevent
the generated config from disabling cops entirely with `Enabled: false`.

Example usage of configuration inside Ruby project:

```ruby
inherit_gem:
  silvercop: .rubocop.yml

inherit_from: .rubocop_todo.yml

```

## Cop Documentation
Rubocop's documentation is thorough, he's a link directly to the Cops:
http://www.rubydoc.info/github/bbatsov/RuboCop/RuboCop/Cop
