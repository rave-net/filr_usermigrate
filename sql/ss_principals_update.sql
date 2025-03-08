UPDATE ss_principals AS target
SET ldapguid = source.ldapguid,
    samaccountname = source.samaccountname
FROM ss_principals AS source
WHERE target.emailaddress = source.emailaddress
  AND target.zoneid = 1
  AND source.zoneid = ####
  AND target.type = 'user'
  AND target.deleted = FALSE
  AND target.emailaddress LIKE '%smseng.com%';
