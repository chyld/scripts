# encoding: utf-8
branches = STDIN.read.chomp
if !branches.empty?
  branch = branches.split("\n").map(&:strip)[0].split(' ').map(&:strip)[-1]
  is_clean = branches.include?("nothing to commit")
  if !branches.empty?
    if is_clean
      puts " #{branch}"
    else
      puts " *#{branch.reverse[1..(branch.size - 1)]}"
    end
  end
end
