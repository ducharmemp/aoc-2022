init name:
    #!/usr/bin/env bash
    set -euxo pipefail
    mkdir -p lib/aoc2022
    mkdir -p lib/mix/tasks 
    mkdir -p test/aoc2022
    mkdir -p inputs
    export NAME=$(echo {{name}} | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}')
    export LOWERNAME={{name}}
    export TESTNAME="$(echo {{name}} | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}')Test"

    envsubst < _template/module.tpl.ex > lib/aoc2022/{{name}}.ex
    envsubst < _template/task.p1.tpl.ex > lib/mix/tasks/{{name}}.p1.ex
    envsubst < _template/task.p2.tpl.ex > lib/mix/tasks/{{name}}.p2.ex
    envsubst < _template/test.tpl.exs > test/aoc2022/{{name}}_test.exs
    touch inputs/{{name}}.txt

check name:
    mix compile
    mix {{name}}.p1
    mix {{name}}.p2

fmt:
    mix format

run name: (check name) (fmt)
    mix test

clean:
    mix clean

done name: (run name)
    git add .
    git cm "Done with {{name}}"
    git push