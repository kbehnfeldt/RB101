flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# ---My Solution---

# flintstones.map { |name| name.slice!(3..-1) }

# ---LS Solution---

flintstones.map! { |name| name[0,3] }

p flintstones