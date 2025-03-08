SELECT target.id, 
       target.emailaddress, 
       target.ldapguid AS old_ldapguid, 
       source.ldapguid AS new_ldapguid,
       target.samaccountname AS old_samaccountname,
       source.samaccountname AS new_samaccountname
FROM ss_principals AS target
JOIN ss_principals AS source
ON target.emailaddress = source.emailaddress
WHERE target.zoneid = 1
  AND source.zoneid = ####
  AND target.type = 'user'
  AND target.deleted = FALSE
  AND target.emailaddress LIKE '%smseng.com%';
