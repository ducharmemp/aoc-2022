init name:
    mkdir -p lib/aoc2022
    mkdir -p lib/mix/tasks 
    mkdir -p test/aoc2022
    name={{name}} envsubst "$name" < _template/module.tpl.ex > lib/aoc2022/{{name}}.ex
    name={{name}} envsubst "$name" < _template/task.p1.tpl.ex > lib/mix/tasks/{{name}}.p1.ex
    name={{name}} envsubst "$name" < _template/task.p2.tpl.ex > lib/mix/tasks/{{name}}.p2.ex
    name={{name}} envsubst "$name" < _template/test.tpl.ex > test/aoc2022/{{name}}_test.ex

check:
    mix compile

fmt:
    mix format

run: (check) (fmt)
    mix test

clean:
    mix clean

done name: (run)
    git add .
    git cm "Done with {{name}}"
    git push