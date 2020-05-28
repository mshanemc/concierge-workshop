# sfdx force:org:create -f config/project-scratch-def.json -d 1 -s
sfdx shane:org:create -f config/snapshot-project-scratch-def.json -d 30 -s -n --userprefix electron --userdomain ee.demo
sfdx force:data:record:update -s User -w "Name='User User'" -v "UserPermissionsKnowledgeUser=true"

sfdx force:source:push
sfdx force:org:open