JOKES = {
  "live.com" => "%s, aren't you born before 1973?",
  "gmail.com" => "%s, you're an average but modern person",
  "lewagon.org" => "Well done %s, you're skilled and capable"
}

EMAIL_PATTERN = /([^\.@]+)(?:\.([^@]+))?@([^@]+)/

def mail_joke(email)
  groups = EMAIL_PATTERN.match(email)
  if groups.nil?
    fail ArgumentError, "'#{email}' is not a valid email address"
  else
    first_name, last_name, email_domain = groups[1], groups[2], groups[3]
    compute_joke(first_name, last_name, email_domain)
  end
end

def compute_joke(first_name, last_name, email_domain)
  full_name = last_name.nil? ? first_name : [first_name, last_name].join(" ")

  if JOKES[email_domain].nil?
    "Sorry #{full_name}, we don't know how to judge '#{email_domain}'"
  else
    JOKES[email_domain] % full_name
  end
end
