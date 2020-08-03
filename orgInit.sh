sfdx shane:org:create -f config/project-scratch-def.json -d 1 -s -n --userprefix concierge --userdomain work.shop
sfdx force:package:install --package 04t4P000002qm6f --noprompt --wait 50
sfdx force:data:record:update -s User -w "Name='User User'" -v "UserPermissionsKnowledgeUser=true"

sfdx force:source:push
sfdx force:user:permset:assign -n solutions
sfdx force:data:bulk:upsert -f data/Knowledge__kav.csv -i id -s Knowledge__kav --wait 30
# sfdx automig:load -d data

sfdx force:apex:execute -f scripts/conciergeSetup.cls

sfdx automig:load -d data2
sfdx force:org:open