def parse:
  def interpret:
    if . == null then .
    elif startswith("\"") and endswith("\"")
    then  .[1:-1]
    else tonumber? // .
    end;
  (capture( "[ \t]*(?<key>[^:= ]*)(: | = )(?<value>.*)" ) // null)
  | if . then .value = (.value | interpret) else . end
;

# Construct one object for each "segment"  
def construct(s): 
  [ foreach (s, 0) as $kv (null;
      if $kv == 0 or $kv.index
      then .complete = .accumulator | .accumulator = $kv
      else .complete = null | .accumulator += $kv
      end;
      .complete // empty ) ]
;


construct(inputs | parse | select(.) | {(.key):.value})
| map( {pid: .["application.process.id"],
        index,
        appname: .["application.name"],
        medianame: .["media.name"]} )

