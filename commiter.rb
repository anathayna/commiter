first_arg = ARGV[0].downcase

if first_arg == "help" && ARGV[1] == nil
  helpmsg = %{
    Usage

    CTX=test ruby commiter.rb INTENTION FULL MESSAGE

    Permitted intentions
    -bg --Bug fix (bugfix)
    -st --Start project
    -w --Work in progress
    -cr --Code review suggestion changes
    -p --Performance related changes
    -mt --Maintenance changes: linter, config updates, etc.
    -rem --Removing code
  }

  puts helpmsg

  return
end

commit_msg = ARGV[1..]

current_context = ENV["CTX"] || ENV["GLOBAL_COMMIT_CTX"] || "default"

if current_context.length > 10
  puts "The lenth of context should not be greather than 10."
end

templatemsg = ""

case first_arg
when "-bg"
  templatemsg += ":beetle: bugfix(#{current_context}):"
when "-fx"
  templatemsg += ":gear: fix(#{current_context}):"
when "-st"
  templatemsg += ":tada: start(#{current_context}):"
when "-ft"
  templatemsg += ":building_construction: feature(#{current_context}):"
when "-w"
  templatemsg += ":construction: wip(#{current_context}):"
when "-dv"
  templatemsg += ":computer: development(#{current_context}):"
when "-p"
  templatemsg += ":racehorse: performance(#{current_context}):"
when "-mt"
  templatemsg += ":wrench: maintenance(#{current_context}):"
when "-me"
  templatemsg += ":bar_chart: metrics(#{current_context}):"
when "-rem"
  templatemsg += ":fire: codingremoval(#{current_context}):"
when "-cr"
  templatemsg += ":pencil: codereview(#{current_context}):"
when "-tt"
  templatemsg += ":test_tube: test(#{current_context}):"
when "-as"
  templatemsg += ":framed_picture: asset(#{current_context}):"
when "-cold"
  templatemsg += ":ice_cube: coldfix(#{current_context}):"
when "-hot"
  templatemsg += ":fire: hotfix(#{current_context}):"
when "-bp"
  templatemsg += ":rocket: version-bump(#{current_context}):"
when "-doc"
  templatemsg += ":books: documentation(#{current_context}):"
when "-std"
  templatemsg += ":open_book: study(#{current_context}):"
else
  raise "wrong args"
end

templatemsg += " #{commit_msg.join(" ")}"

puts `git commit -m "#{templatemsg}"`
