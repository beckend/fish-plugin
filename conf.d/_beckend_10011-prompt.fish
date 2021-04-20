if type -q prmt
    function fish_prompt
      set -l code $status
      printf '%s%s%s💻%s%s%s' \
          (set_color (if test $USER = 'root'; echo red; else; echo yellow; end)) $USER (set_color normal) \
          (set_color magenta) $hostname (set_color normal)

      prmt --code $code ' {path:cyan::🗂️ }{git:#FF69B4:s: on :}{python:yellow:m: 🐍 }{rust:red:full: 🦀 }{node:green:full: ⬢ }{deno:green:full: 🌿 }{go:cyan:full: 🦫 }{ok:green: ✓}{fail:red:code}\n> '
    end
end
