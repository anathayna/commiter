# Pre-requisites

You need to have `ruby` installed for the commiter to work.

If **not** installed you can follow the ruby's installation instruction through [here](https://github.com/rvm/ubuntu_rvm)

# Commiter

* Clone the project into a fixed folder that should not be changed.
* Run `./setup.sh`
* Reload terminal
* Follow the usage instructions

# Usage

## Setting the global commit context

### Why use global context

Global context should be used when you will work on a specific project for a long time. Doing this will avoid the need to set a specific context on commit command every time.

### Setting the context

To set a global commit context the ./commit_setctx.sh script can be used like the example:

`. commit_setctx.sh globalctx`

After the global context is set, all commits will use this context. The only exception to it is when this prefix `CTX=anothectx` is added to a commit call. For this use only, the execution context will not be the global one, but the one added to the `CTX` environment variable.

## Commiter script usage

```
    Usage

    CTX=test ruby commiter.rb INTENTION FULL MESSAGE

    Permitted intentions
    -b --Bug fix (bugfix)
    -s --Start project
    -f --Finish project
    -d --Documentation or anyone comment on code only
    -w --Work in progress
    -r --Code review suggestion changes
    -p --Performance related changes
    -m --Maintenance changes: linter, config updates, etc.
    -rem --Code removing only
```

#### Example 1

```
# Set the next PR contexts based on the current Jira task
commit-ctx PR-123

# Start the PR execution
commit -s create the skeleton of the project

# Wip
commit -c implement cron class
commit -c iojasoijdaios

# Final commit before code review
commit -f fix final specs

# Fix some code review adjustments
commit -r code review adjustments

# Fix a bug or a problem that ocurred in the project
commit -b hahahha
```

#### Example 2

```
CTX=randomspec commit -m fix commit specs related with controller X
```

# Easy setup method

To easly setup the commiter, the execution of the `setup.sh` file will automatically include the following alias into `~/.bashrc`:

```
alias commit-ctx=". ABSOLUTE_PATH_TO_REPOSITORY/commiter/commit_setctx.sh"
alias commit="ruby ABSOLUTE_PATH_TO_REPOSITORY/commiter/commiter.rb"
```

# Greetings!

Have fun!

## My Commiter 🌻

```
commit-ctx [current_context here]
commit [-...]
```

* `-bg`: “:beetle: bugfix(current_context):”
* `-fx`: “:gear: fix(current_context):”
* `-st`: “:tada: start(current_context):”
* `-ft`: “:building_construction: feature(current_context):”
* `-w`: “:construction: wip(current_context):”
* `-dv`: “:computer: development(current_context):”
* `-mt`: “:wrench: maintenance(current_context):”
* `-me`: “:bar_chart: metrics(current_context):”
* `-rem`: “:fire: codingremoval(current_context):”
* `-cr`: “:memo: codereview(current_context):”
* `-tt`: “:test_tube: test(current_context):”
* `-as`: “:framed_picture: asset(current_context):”
* `-cold`: “:ice_cube: coldfix(current_context):”
* `-hot`: “:fire: hotfix(current_context):”
* `-bp`: “:rocket: version-bump(current_context):”
* `-doc`: “:books: documentation(current_context):”
* `-std`: “:open_book: study(current_context):”
* `-ft`: “:building_construction: feature(current_context):”


