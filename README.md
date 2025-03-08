# filr_usermigrate
This is a set of sql scripts and basic steps for migrating Filr/Vibe/TeamWorks users between different ldap repositories such as Edir to AD
The basic steps are to create second zone on system and configure it against the new LDAP respository to get all the target users and groups in it, then use this data to modify original zone's users and groups with the new attribute values.  Script examples are targeting migrating to Active Directory from Edirectory.  You also need to modify your netfolder servers to direct to the new backend shares / volumes.  You'll want your new shares to be setup to appear same on network as the previous infastructure.
source.zoneid = the NEW temporary zone being setup to sync against new LDAP source
target.zoneid is your original zone you are modifying.  usually zone 1.

1: Setup a second zone in your Filr/Vibe/Teamworks

2: Note the zoneid of both primary and your new test zone, and put this into 

3: login to your test zone and configure the target diretory service, making sure your ldap filters are configured appropriately to emulate your original zone user/group results, and test to make sure this works

4: shutdown your Filr/Vibe/TeamWorks system, only leaving the database available

5: run the various scripts for user principals, and group dry run to check results before doing the actual user modification

6: startup services again and test users can authenticate

7: reconfigure the netfolder servers to new network shares, and appropriate proxy user with required rights.

8: configure your users my files as approprate if redirecting to directory based home folders.

9: resync all netfolders and users.

