SELECT target.id, 
       target.name, 
       target.ldapguid AS old_ldapguid, 
       source.ldapguid AS new_ldapguid
FROM ss_principals AS target
JOIN ss_principals AS source
ON target.name = source.name
WHERE target.zoneid = 1
  AND source.zoneid = ####
  AND target.type = 'group'
  AND target.deleted = false
  AND target.fromldap = true
  AND target.ldapcontainer IS NULL;
