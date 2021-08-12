# Overview

This gem houses RuboCop configuration files to be included in Silvercar Ruby projects.

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

**Note**: Make sure you update the gemspec `spec.version`, otherwise the build will fail saying the package already
exists.

## Usage

RuboCop uses yml files to describe configuration. To begin using this with default configuration,
create a `.rubocop.yml` file in the root of your project with the following contents:

```ruby
inherit_gem:
  silvercop: .rubocop.yml
```

It is recommended to use this gem as `bundle exec rubocop -D`, which will output the violated
cop for that line of code

## Intent of Linting Configuration

Rubocop supports the generation of a todo file that helps add linting to a legacy project
without needing to address all the linting violations up front. However, this does split
the linting configuration across multiple files.

For consistency within Ruby projects, the following conventions should be followed:

#### .rubocop.yml
Inherits from silvercop's .rubocop.yml file and contains project level settings. Adding configuration to this file indicates the project is overriding silvercop's or rubocop's default configuration. These settings can change over time.

#### .rubocop_todo.yml
Contains explicit exclusions so that Rubocop can lint the project without addressing all violations within the project. Any cops or files that exist in this file are expected to be resolved and come into alignment with rules established within `.rubocop.yml`. Code modifications can temporarily allow for style alignment to be addressed as follow-up, depending on the scope of effort. Newly written code should follow styling and conventions, using this file as a last resort.

#### rubocop:disable, rubocop:enable
Used inline within code to locally disable and re-enable specific cops. This conveys the same intent as configuration within `.rubocop.yml` because generation and maintenance of `.rubocop_todo.yml` will not take into account locally disabled cops. If the intent of the styling changing is intended and permanent, the configuration must exist in `.rubocop.yml` and not use `rubocop:disable` locally.

#### rubocop:todo, rubocop:enable
Used inline within code to locally disable and re-enable specific cops. `rubocop:todo` is aliased to `rubocop:disable` but conveys the intent that addressing the styling or convention issue will be addressed as follow-up. Prefer using `rubocop_todo.yml` over this method.

## Creating TODO List

If many offenses are detected, it is recommended to generate a TODO list that can be handled over
time without needing to fix all of the existing offenses. This can be done by generating and
including the following config:

`bundle exec rubocop -D --auto-gen-config`

Then add `inherit_from: .rubocop_todo.yml` to your `.rubocop.yml` file. Adding `--exclude-limit 10000` can help prevent
the generated config from disabling cops entirely with `Enabled: false`.

Many of the `Metric/*` cops will analyze the code to find the worst offender and make that the new threshold. It is
recommended to set a sane limit and manually exclude violations beyond that sane threshold. For example, generating the
todo file in one repo attempts to set the `Metrics/LineLength` at a `Max` of 295 because that's the longest method in
the code base, which means the cop will no longer trigger any violations unless methods exceed 295 lines. Instead, set
the `Max` to something which creates a balance between a reasonable length and number of violations. As those violations
get addressed, the threshold can be tightened toward the organization/project standard or to the default. In this
example, the `Max` was set to 20 with an eventual goal of 10.

An example of doing this and easily capturing the violations is to set the `Max` to 20 in the todo file, then run:
`bundle exec rubocop -D --only Metrics/MethodLength --format files`

which will output a list of files that can then be pasted as the `Exclude` list in the todo file.

Putting these defaults in `.rubocop.yml` can help to remember the current threshold and indicate the target goal, but
that `Max` will not be taken into account when generating the todo file.

Example usage of configuration inside Ruby project:

```ruby
inherit_gem:
  silvercop: .rubocop.yml

inherit_from: .rubocop_todo.yml

```

## Cop Documentation
Rubocop's documentation is thorough, he's a link directly to the Cops:
http://www.rubydoc.info/github/bbatsov/RuboCop/RuboCop/Cop
