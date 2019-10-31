# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

def staggered_case(str)
  cap = true
  new_str = ''
  str.downcase.chars.each do |char|
    if ('a'..'z').include?(char)
      new_str += char.upcase if cap
      new_str += char if !cap
      cap = !cap
    else
      new_str += char
    end
  end
  new_str
end

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
